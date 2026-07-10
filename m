Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E39224677B
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691922; cv=none; b=ak4kFISpINnwnxXhstvAC20rsSiFmtSO1mUP2W7zl7BL2PS5ifj9qNI2Bm8wye1uOz3dVPPdEoHXeUKFUgwzUfgNi16nIb/pDYDCEME+ESUnZ0XQYkSuPN1t1IZWzilSjXzPuwyc7wOcyPDLM/vzA7ikVwkAD0xZDDS+Yvu6wP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691922; c=relaxed/simple;
	bh=oDMFkzxjs/KXUSaVb8duhkY5CEnHTeJPvE9VzQ6FDQc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VfLgOcuQWkc1gg1nzkmdSwSge7ikIugd5We870cZaAIc0VVyUDhiCpLyII4amXSoPtYaSV9Sd+dN74VzmXelpem7guRoDjK78AfZn4wr3W4KXV6tDXoWjNqeLuXISBwTNRIxzflS03ZPy7JyKjZNV0pVnWDih/bjlTlM3hwhfgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HHVfu76P; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="HHVfu76P"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15e0c3f395so111831566b.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783691917; x=1784296717; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oDMFkzxjs/KXUSaVb8duhkY5CEnHTeJPvE9VzQ6FDQc=;
        b=HHVfu76PljNItpbRCBn4egmQy6/B4UiN8P92zrc5eGS0B0Q65poEDe3B2DnA7Z6Omj
         TRLYt4zjm7+5inPC/IUfNvo//2eI5r69qMPEjguJsqgWCz0/oqUm0c3NrdqfYuX/ULk2
         KkBgXb/3Fk+qsAEF0xXvZ/6cpluqpHOdwJ8/jxUa5Aa6t3zw/F/7mgJSHK+gLGs/IUfZ
         2hF+DhfL9i5fU3Tf6lYwSsn0vroM86DXkbciETq8JhqFW/45D6CbeC7wAEUTIKuNktYd
         6V6IHuCITuCDgPxye6L4kDBBwpgQRO07k3FXBQCVSbaPCAoPvg1aNvS/tNygqakVAKXv
         yHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691917; x=1784296717;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDMFkzxjs/KXUSaVb8duhkY5CEnHTeJPvE9VzQ6FDQc=;
        b=j9zLzXj9fRbHEi8A28fkob3XwH5He1BR1VR8RheAYtUo3OHnsAdJDjuXwZit7Joa6/
         CQ4/HmtUVZsCzC63AkMbsb4dfyPzEqREn3z/LNu3Ee0jyQlKBaIiq6JvKmbBB7ZAQBWV
         AMsmp0ipmaaLicw+pZNnOBGrPTrs3DJA+qFdhrpWjX+IEpeeHu3Gk6oexIUCnovjA0ph
         MSxv/KfvCIwpE9/vv6Pr3rApHqdB+XRMstCACJHYqaXljj766MqWIcIGHUV3e0VpFLn+
         /oIepZhN1Bbw7n+QlZLhUzQkZr2acwfmO0r9j54LGlyCRcyvQ0+iwDqBOlRdItC0dh6q
         xn6A==
X-Forwarded-Encrypted: i=1; AHgh+RrpLgLGVG9UlFfjXV/4SZLFlbEWUKT2FQou9roucg9bq4lOteu88xW2Z31K/WDWkA8jJcuxmONkq6oU@vger.kernel.org
X-Gm-Message-State: AOJu0YzRtBI4OkNvorCGi0gJMgOeCtARJ6rij22FLxGZLhMfIzYnvvrN
	0jEdFC4lDsNR6aX4BaWKu55cktJkelRgrdLdmG1/xj1gg/R6WYGHMVLl3it9vrBYp4g=
X-Gm-Gg: AfdE7ckFygQsJscegzyl0uqkz4/Uh18qac3lMRnNAxJb0m65nU7qKUTP6MDnc1vEi6Q
	kvPKkrUffjonNDRe3qc0vzi1+Q++9rOa8b/9FFUgzXIo2JujvtkLIXOuTWtiPhaL6lE6KC//Yev
	kfxfcvaqrcES8Rhng2oB7E2RQ8CuDQ8kcTxHcApvl0ihqxUKXeHryd4dFjZVWOUH8iCtW7+oyZz
	y9znJu4CS9w7GyzZ1tcRPF479kiMq9r1b83nilxfxNSrdfYsXUso7wdlXtQq5vDAJ32S5CTe+e1
	HZtJelI5RnDXyv+3QGlF9BXMVIk0WIH90uSZUg9pqT9iWGYtyFcaYWucYghJ3SkzhAI0yMs0q9d
	O5RwkMbs8JwyYstIyX/ZrMe0e5ZxBxXtVpPakl5a1UxWATiJYYtKUVzqRXVjn5XpWAYx+x9Vuiq
	7Cv0bYQpCfdQa0afNZaXtb6N3EA8KWoo+TYnB7liVQ2ibVyJWDQ3j532yMcg==
X-Received: by 2002:a17:907:990f:b0:c12:695b:8876 with SMTP id a640c23a62f3a-c15cded1355mr392545366b.5.1783691917105;
        Fri, 10 Jul 2026 06:58:37 -0700 (PDT)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d3859f69sm407039066b.27.2026.07.10.06.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:58:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 15:58:35 +0200
Message-Id: <DJUY0I0R3DGG.1YC9D7H4AAI0J@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: milos: add OSM L3 node
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Georgi Djakov" <djakov@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Sibi Sankar"
 <sibi.sankar@oss.qualcomm.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Alexander Koskovich"
 <akoskovich@pm.me>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
 <20260710-milos-cpu-opp-v1-2-ae7f4b09bc77@fairphone.com>
 <bf766035-54fa-4e98-8abe-22cf0a229ffa@oss.qualcomm.com>
In-Reply-To: <bf766035-54fa-4e98-8abe-22cf0a229ffa@oss.qualcomm.com>

Hi Konrad,

On Fri Jul 10, 2026 at 3:44 PM CEST, Konrad Dybcio wrote:
> On 7/10/26 11:22 AM, Luca Weiss wrote:
>> Add the OSC L3 Cache controller node.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>
> I'd suggest to squash this series into 1 big patch, without patch
> 3 applied the OSM driver will engage and perform sync_state (with
> 0 requests, so it will vote for 0/lowest) and the system
> performance will be tragic

Fair point I think, I took the structure of the patches from sm8650
which had it split this way but yes, it doesn't make too much sense in
terms of keeping system performance alive through bisection.

Will do so in v2.

Regards
Luca

>
> Konrad

