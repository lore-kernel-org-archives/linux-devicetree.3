Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688230;
	b=TukSV/NpGbRxvl8rVstWnD8XCJLfkauExpZFL1dy7QxVpSgeYFgWcPUYNZQmwj1YuhyV
	 ZECEUXj02vIi9L7USjk/2Xy5xBpgC/OEdoDOCUseWjqlq1xEJ9tAiMEkqhiYg5CKeyW+V
	 88izBYQGI9vBdkhHF3+a1SeyRtuQKviJPoZ+LMR11mg+PxUplQk03V/iHzG/XWY4jIytc
	 +vJAonUQsyWlJdSET4bNdqctoeK9xneiiWRVj+Tq2tyXHZ3pN2/POqbZHev1MCrxj1R/K
	 MKP3NsdJHKGtdy6swC2YV+8s7+Ol0IUS2VdtC7mSBWx4+LNIhxsoutwb6mBZo02IJDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688230;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=23P8WTqaWLx/JVjU79g/iKQ+lH2hcpBv3+gxre4N+nM=;
	b=cs7VoD2hxdiokkSFVST6Y/kkbdk/qzhCZ485+00ceQKQJgrrC5JsY83vOaAqlP3UypWb
	 bnFshTfyxgAHCsqmEd/F20rNo47JnuEmLKgc6EvRB5fCWAiKUOkaJD5qolKhGApH3TBlV
	 4y/CjVZ137VY4o5NB/CwUHUyIr9RavcNCZTJhezpvU7THVto7ozfGwqFA3aCdEdMR8Pe0
	 gtwqh3nLT1Io5Xz8omxPvhqV+kDtMXiz953XJR+YwpY7znY3rlPUvTsfzpT3eOH+mdcvv
	 SPf/vfT1D721kcWrzQZjB3JA2LQcmg/MM2AMZahD0fuX6s4Gv8FsjY+Ji/Pb5s9h3GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jnGJyBaB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8497606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jnGJyBaB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7121F000E1;
	Thu, 26 Nov 2026 10:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795688230;
	bh=23P8WTqaWLx/JVjU79g/iKQ+lH2hcpBv3+gxre4N+nM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jnGJyBaB2dS0yDYWxF0RJN0esZ3wQwvoCVrFmpVY3O8vP39yKO4+RmAxNV1hXYkrq
	 /NO+H45jQ7Cs01l6FRRienkJg91Qa0Ozbc1ZS+X/ZECD5QQG3PucxZtNZMvjGDQs6p
	 BjkmSAnbuVMIHXMRNYU3ytgfH7vrSCHv/cELoz3TkvEkfWcRxAddU6Wolsf1PJZADr
	 +6jhaQXMLa6QSVilFraxxw0/4WMhwNPyGpR92OVn2WnbegE8mz04HIttMiVd6L8CZX
	 lJTeVL5zmnkp9CgS86/a9Pdnz+O2RxWrbyUaNVO/ffuL0fYgmOjmyktM+8Nugr3Spb
	 wLYcHLueG9ATg==
Message-ID: <sashiko-outbox-235267@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 13/14] perf tools: Initial support for gtrace decoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <905e9e671d6b23bd33527c828c3dee212341e246.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
 <905e9e671d6b23bd33527c828c3dee212341e246.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 10:17:10 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] perf gtrace: unconsumed pipe payload in
  gtrace_process_auxtrace_event()
--

commit aa86191c124d5417c0c0399ddfc0c607fe1d1b9d
Author: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

perf tools: Initial support for gtrace decoder

This commit adds stub auxtrace callbacks for PERF_AUXTRACE_GTRACE so
gtrace trace data can be recorded into perf.data files.

> diff --git a/tools/perf/util/gtrace-decoder.c b/tools/perf/util/gtrace-de=
coder.c
> new file mode 100644
> index 0000000000000..503fbaac12c6b
> --- /dev/null
> +++ b/tools/perf/util/gtrace-decoder.c
[ ... ]
> +static int gtrace_process_auxtrace_event(struct perf_session *session __=
maybe_unused,
> +					  union perf_event *event __maybe_unused,
> +					  const struct perf_tool *tool __maybe_unused)
> +{
> +	return 0;
> +}

[Severity: Medium]
Does gtrace_process_auxtrace_event() leave event->auxtrace.size bytes of
AUX payload unread in the stream when perf_data__is_pipe(session->data) is
true?

In pipe mode, __perf_session__process_pipe_events() only reads the
perf_record_auxtrace header and expects tool->auxtrace to consume the
trailing payload from the pipe fd (as process_event_auxtrace_stub() does
with skipn()).  Returning 0 without consuming those bytes causes the next
loop iteration to read raw AUX payload as the next perf_event_header,
corrupting and aborting piped sessions such as "perf record -o - | perf
report".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795512532.gi=
t.mayuresh.chitale@oss.qualcomm.com?part=3D13
