Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590550;
	b=k8n8k9vcqedbOfUgcktXk1joqRcExhZ/z1f2+8zpy4SgrYjqv1DfwGkLDq42LY71dEss
	 cjM8XyorntKAMlpeqWPA4/ycvf3Xi6VX5hHYRzCEJJsTITeyb+y/Y88z0L65zYeadAMGW
	 y8UrUIfNr3JAAFOaf7yEL+K8+LBoKoic+iugruZwJG4iS75xLJQcXRiXB3UikNLQAq6hV
	 KvQxmf3ALNCJnzACLXWXb1iOIE8Zk+fGdRP6Hmm6mKWHeB/M1YouhJYosdtHw3K4ZALuT
	 wCPPd07XXdQVvS7CZi5htOJFxMx8P+hA9K6VFwt8lSzd4aiPj93J6g0DGfzzlteSuKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590550;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=fHukDD0UbvmUT77AtdgTmVuLRMj4asR7tQ0Y9WypVT0=;
	b=DPazdr+X2sXbDJrYIrKpd+N+HxICcszXKahH7YKznt3yvGBPupc2ycGYbsv2uqC/kutU
	 NHRiYmcE2OOgVWr1cGCKf71hGnpj/ZJsWfgpr3ikWXC0GCKnGHs95/bvF32e9BMazGpC8
	 xFl+EGGDf15AHt2QOymaInwXRLJaGpbTSDY6q2QJqaSkTZOnVhXZwZ3vmrQRUnaffDQdh
	 nNL+GCbCOcUJNM55KO8cE/EZwzWoBNRUzvGKCfq1cxrFaJ5WYtwIb755GdvzCJUXkGdha
	 Yiu8Ap10WxGSIPFOwuyC51LheNxFnKTUstrLKjtXoIgc6luYETQYvw/PgfaTU995GWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KRcjhF+R;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OtW9r7JX;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57576074B1B
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 17:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D57576074B1B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KRcjhF+R;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OtW9r7JX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794590548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHukDD0UbvmUT77AtdgTmVuLRMj4asR7tQ0Y9WypVT0=;
	b=KRcjhF+RtPnWX3GsI5skqntxmM0vHfqxVFBaRIAMHiglw7l5fvmshDNlkEcxnXX2sGhmEn
	1LGqslG4j2Ha9ldDyoOCdacOqOjtCppDXtqyObg+okfSoVsFOSY7AdDkXIjX/8SH0Lzt2c
	YwM2L7y8GWeHknfZbzILuN0XDElmMqs=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-zWh--s1dMQSE_jtqXvuXcQ-1; Fri, 13 Nov 2026 12:22:27 -0500
X-MC-Unique: zWh--s1dMQSE_jtqXvuXcQ-1
X-Mimecast-MFC-AGG-ID: zWh--s1dMQSE_jtqXvuXcQ_1794590547
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5351f1b26e6so17473371cf.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794590547; x=1795195347; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fHukDD0UbvmUT77AtdgTmVuLRMj4asR7tQ0Y9WypVT0=;
        b=OtW9r7JXbnyn7IcLoiUeJRRYwV30QCLlQsmVB600ewBp4Lvq5aeqQ2mrVwNpR08wb1
         e35g2VxQ1d7UhLAJVUu8qY2dZ47ZUhilAh8bmL1Rn9b+S5iffMzKVk0O5offhoYBw65Q
         5e9wVmEvCOL2PIPyVrDnKcXzUFNB2nFJ5j53Qh/Wu7R7vk/TC25TjVrRtJ1Vc6wts4Ic
         oRYgYHSs5j0IM5jXk3rcfn5fYR12DPDDm6eEZJzIQZILfYYgGLJ21ZzN4GEYjs36kseZ
         hCVclv4XM2DPwoheGQKqIkezr8r5g7bp0UM/zFi2zR1ElMe4AAVB3HLuDaLP9n3xcWqI
         tCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590547; x=1795195347;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fHukDD0UbvmUT77AtdgTmVuLRMj4asR7tQ0Y9WypVT0=;
        b=KqJWwWN6hCqbnEUtZ5FT098gjoc4nCJUrhtIfg1QcwlFk9P3zk9Su/68FNZucQqNIB
         Lyup77exf3Vprb6O9vI1Xv2kBPp76MDLohbAuxqCgfrIr8C/2PDS7qOMQpsLh3inQyRI
         rQZhYya890sUssqa5FHzdcFL+EGso9tbviSGfYhelwKge5sQwCXi/c9GCqsnDjUKZUNL
         ABT4Um6VcQ0MoVWI3aG82noiON7jy2QnjN/ka1IDkB+pwxm55KjOMZ59Tzk5QMxHzt3u
         LueEgYtDXDbGT2SmbvZPYeq2dhkA6ezYFCQ4vV/nGxbr93prt/zIgt2H0FS7j6lbs4Of
         n7AQ==
X-Forwarded-Encrypted: i=1; AL+hErEuV5IPp5F3EyUhUU2DLvNO3COEQePdy+wAlqBrk3AkxgrIo8G063nW9xDPPpEAD+qVVqw08O3UDnXm@vger.kernel.org
X-Gm-Message-State: APuU4Z8IV/0TjwczUBxdQcNiD7CG7ZuBEjjYY7FDezmnQO1R+EW182kE
	7xTuV+uHsjVbdhTirG/szb0Iw6bS2jsmsK44dU9SulYfAs8m97jeFXvIU3FmeMWKUxC/ZjMovpT
	AEIleKBe5qM0A89QSWwHb8RvZ5ZJFS0FIK0G56IKcU6UcHGfs5MJovIjTLZxpA4Q=
X-Gm-Gg: AYBFou1UN+lGlTl7LRmPv9YxzJx80/WLIxTCZdhqUX/acwTttPIt//HAVIVY8/2r3K8
	dUGpUcKdwQOjc0FE9Vqp+r/3Y633KF0vrzq/iIpcmT5Tmye6YOFhZdqyLgJZsuRRrRA50KWMfrp
	FjLQOoyxUN2qSBMOvZUl/lhS02iJ3z6cJS9JECUkFUkl4p1q2p/m0kaWGIfeTLcT0ugl47U5Rtu
	eAQc4nvUo3DSpLX1X5D3iEA8keQbg9U/X1JVDAgDoNSZODiSyYxJJVBu5QX4TH2ttR+IZ/3g2nV
	Et+u/2ZzG7OosOpPa88k+iHgcr/esvskTg0zgXMjrn2HuaNuaI72qAz86AAuXM6cjJP1qiKBmVC
	8WAGYLND9h14P9iRwHkbATzJS+pz5VEKKdu39bo6j6rBEv8oqI8MYsUi1t9iscwacluvsOoGzZk
	fqx6YXo122QcQL1Y86t7jFf1G1DLUmfwNMADDAzmVR
X-Received: by 2002:a05:622a:550e:b0:535:70b4:3f7c with SMTP id d75a77b69052e-55ac937d6e5mr45976291cf.66.1794590546824;
        Fri, 13 Nov 2026 09:22:26 -0800 (PST)
X-Received: by 2002:a05:622a:550e:b0:535:70b4:3f7c with SMTP id d75a77b69052e-55ac937d6e5mr45975821cf.66.1794590546274;
        Fri, 13 Nov 2026 09:22:26 -0800 (PST)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad14f1ecasm22347291cf.24.2026.11.13.09.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:22:24 -0800 (PST)
Date: Fri, 13 Nov 2026 12:22:22 -0500
From: Brian Masney <bmasney@redhat.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mike Tipton <mike.tipton@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 02/16] clk: Acquire resources for clock transitions
Message-ID: <avdHTgDnTmQYy3CN@redhat.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
 <179275170360.4070168.11650113664838519061.b4-review@b4>
 <f0ca2bd4-851e-473d-bf21-678cf964f854@oss.qualcomm.com>
 <825fbfbe-a9a0-43e2-bb54-f9e38ce779f4@oss.qualcomm.com>
 <179458337623.3308909.8679910347462508471.b4-reply@b4>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179458337623.3308909.8679910347462508471.b4-reply@b4>
User-Agent: Mutt/2.4.3 (2026-10-09)

On Fri, Nov 13, 2026 at 04:22:56PM +0100, Jerome Brunet wrote:
> On 2026-11-09 15:06 +0100, Konrad Dybcio wrote:
> > On 10/26/26 2:11 PM, Konrad Dybcio wrote:
> > > On 10/23/26 12:35 PM, Jerome Brunet wrote:
> > >>> Preparing a clock protects its current requirements, not the resources
> > >>> needed while changing its rate or parent. A transition can temporarily
> > >>> use both parents or access an unprepared clock, and a parent rate change
> > >>> can cause other clocks to be programmed too. Raising resources one clock
> > >>> at a time leaves those operations exposed to insufficient power.
> > >>>
> > >>> Failures make this worse: hardware may already have changed when the
> > >>> operation returns an error. A matching cached rate is then not proof
> > >>> that resource reconciliation finished. Retaining a temporary enable
> > >>> reference without a corresponding prepare reference also breaks a
> > >>> consumer's normal disable/unprepare sequence after a failed reparent.
> > >>>
> > >>> Make CCF acquire the affected tree's and parent paths' resources before
> > >>> notifiers or programming, and reconcile them only when the walk stops.
> > >>> Keep fault recovery independent of rate shortcuts and subsequent
> > >>> consumer reference-count changes. Require explicit recovery of an
> > >>> ancestor's uncertain parent selection rather than reporting success
> > >>> from a descendant request.
> > >>
> > >> I don't think all this is necessary to address the problem described
> > >> here and in the cover letter.
> > >>
> > >> IMO a new provider API is the wrong layer. The framework already has
> > >> the hook a provider needs: the rate change notifiers. What the core
> > >> should do instead is fix those notifiers, which do have a few issues.
> > >> You are fixing one in patch 1. Another fix, about setting the parent,
> > >> was sent recently:
> > >>
> > >> https://patchwork.kernel.org/project/linux-clk/patch/20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com/
> > >>
> > >> You want to act on some changes before anything is programmed. PRE
> > >> notifiers are the right tool for this. The user of this change in
> > >> patch 7 could use them AFAICT: PRE sets a temporary vote, POST settles
> > >> it, ABORT drops it.
> > >>
> > >> Also, what is acquired here follows the requested clock. When an
> > >> ancestor switches parent, the chain of its new parent is not acquired,
> > >> although it feeds the whole subtree after the switch.
> > >>
> > >> With notifiers, the parent fault state is not needed either. As it is,
> > >> it blocks every request on or below the clock until the same switch is
> > >> retried.
> > >>
> > >> Could you tell me what you need from this approach that cannot be done
> > >> with (fixed) notifiers?
> > > 
> > > I'm a little worried about the ordering there, since some device
> > > drivers may also be registering listeners in parallel, so we don't
> > > get a clean split of what PRE means ("has power for sure " or "may
> > > not have power")
> > 
> > Do you have any thoughts on this? I'd like to proceed with this
> > series in one way or another.
> 
> As I have replied before, if there are things to fix in notifiers, we surely
> can discuss it but, at the moment, I don't think the complexity of what you
> are proposing here is justified.
> 
> Please allow some time for Brian to have a look.

I'm hoping to be able to look at this, plus some other requested changes
to the clk core, next week.

Brian

