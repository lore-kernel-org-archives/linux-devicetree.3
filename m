Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615516;
	b=3Fpvl4xi4Hg0nQRu/hN5mlcFOM2UitTHKxze5gCt/pxhiWa5f1RiaiJ93nOy1LKLWHAQ
	 yYf3F8hAdACmeG25MvEQSEIQ19RT+njctM0/dHZvyNizqPIUJLeNdYv2czD03nRu8vqGn
	 Hqs12538dv7L/CEq0a2Oe3x6HpM4rO+NyFZ4gzMxCXZw4jpAyVNPOpXQWcJeF/RXy0j7P
	 MtAvrDK3ZTCunAi7e4sgJZfQfcZ9uhfUuowyXrD49afMgQOSMYjS+D4L4ocRSmXKrHMIB
	 dNzoR+X8ME9vkTKksz91kjrI3lfO5XCnNzGCslK91H/U2DGDskrouS9MGKo+pRcoDBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615516;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uyXnqQWcaQLaj3tsaPz7FL4nVEjagE+Vxk26KQ/sNaU=;
	b=pze3yPflP1Kuda8Bj1yYq5VXilb76UUZAENBxd09yvMWjd7QAQzem44F1WG+DwAjtKKX
	 G/lzoQotlr1/32LY6CYJJmnBsPJa/HFMuXs23TCaxhQQ9UwEC0fI4GIBwKUBt/BiHL7GL
	 remJ0TBiBtXdlefFii5/i+URoeIsqDPlK0Je/jL78V5pReLpOudRLBYpyKjYYrydB7hjo
	 Lz26XbZaeUs6gzFoJx/opUdhBktBDveIN3vKW0rBAAt9tNSFVz2ua1nnHEFO8UXjWBxHP
	 FcG/5Pxzk04WqvZe4whzDkZ0uiZnfLsFpjA5v4awxCJKcns+OqapPPnsCxrl6TAQ29Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CwHYaScC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKBEKybM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F46606A32D
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9F46606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CwHYaScC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKBEKybM
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ABS5260686
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 10:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uyXnqQWcaQLaj3tsaPz7FL4n
	VEjagE+Vxk26KQ/sNaU=; b=CwHYaScCqnAktnLKbwefXAtcrQfw7DQxwntVIy4X
	aEg+V7GMxxJOVyNCMXFNgjoaC2UFXe9b26BiGb3/NQvylRFsZpwICCI3rQlWPqmL
	or1c4wrz0UcGTrI12QXfkujgHzJFf9P6r48vz7VaZ0FFr9PGge/W34hpgqZZ4UcF
	uxat+c5kD59iSk/jEbpIzD7Qjd+1nscDkDvADZM1c/mJQeYK8AFWF0sDsBgkwTjX
	/H7j9zlkVgcFk6N7q7ykac08RHUUEjEUr4PiSN5qrk7p+B3UwM+K4xEWlqz3mw2t
	UP0Ekpeu6LuloBMYLzBWTyHgIAKPLy2h5J0ICCrsNZh6Fw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvrb3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 10:31:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f20addba1so516876185a.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 02:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615514; x=1794220314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uyXnqQWcaQLaj3tsaPz7FL4nVEjagE+Vxk26KQ/sNaU=;
        b=kKBEKybMJJYWp6+wtf8NSp3eNTZ3ybd5ZS9dsuvhyikhgdfcwvo9BB/Nt1jREfn+1K
         sqzVx3C5NqDdaJe7z3SDnZisaRUGn53e1goDptvM9Ya5Ny63RlknGKNoSLtSiDVHp52U
         EgewAshOrkHnAehM0dCt+i+EhIzcLDWTxBMrbVQUC8uj6JsrHkGd+8r4W5/7rhocrc9j
         GxPBtblIm1hfbIKUBJkt4G5xoZvefp+oFX72dfUwZB2QuXlXbQvOGlMUoj3Ashs2+ij6
         wWuFMTIvCLurUhXEHVAfCLymnHWq+XXjx85Amnmmra/WIWFgBOecuRUqWh+gVdF/CMcw
         h+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615514; x=1794220314;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uyXnqQWcaQLaj3tsaPz7FL4nVEjagE+Vxk26KQ/sNaU=;
        b=jr7Q6Vq7oJpaM/LV/ckULTZpDWhunEJdkvz9beRum1VgM7x8fUnMoyd8hpMYwY5j1W
         HSK66hwukUyC2c0a8K3VYQb15+ntE5RC6pMjvwuF5QyBAnyQ6KPEIz+TPG8xXOGw8USs
         EwQQq8i/ROOW8/gPpcvY2dpoxLy2fxJnMcs1INMoOEKCDeR61FT205zfKpVVrWm8KjHJ
         3dU4yCzFgIA8yZLLJWd3jS7Ui60fSuamJnVBpyKdtrUKLo2sYcnlJ2UWzywDMTh2/JzN
         i3CNa6SXu1QouFNWcI1NzhnSJMbZvYJ+XZJEanjnAlfjRm77OYb/mVdcDwMEvBcUoyxl
         BBnQ==
X-Forwarded-Encrypted: i=1; AKwUvBy05HhfcFQYipjEHDDizUP0uv93df8EUca0OpJ0NJ2gsy+KuptbUE2JkoFeTKoY/+4Zc4u2ckgw4VQW@vger.kernel.org
X-Gm-Message-State: AFq9FYIxb2tT0kaMwwLmL6KQQFMZzK8u2MzI7k308qQf0Wg3mHyQkurq
	qN3x5GKIz/EfPd4aalkN5momhCE24C38SZgyjlKp1wxpYdMG0Y9F/3zXCEWPLL0gbv6uUFArRsC
	xgkILW87wltQ0/KYIgD5cCOXQMsthf1kq9lJkmAQsRoSuaP3W6eoZjHt+dQZe4meT
X-Gm-Gg: AYBFou2EEbEIuSZccxbhUl+EFsmI3C45Tnj8YyXuVXvhD3rKQ38E8JXc7uzv99yud6b
	Tyhk1FnRidx5c44JF4ohdGLxMRsOw28GlFwDP2CuadSCgIGyYuIeFcLmnFU+ToziFnb2lciJe/g
	wxWWv2293ejVxM6h9FNr9NOMF/5nxMJ8DMNpTLe/VbKIDAMmcyHhbZehTd1YrXAGuzVKd1bDVvc
	rWYqiW0SkPyiYwFmqZiyLCMWcz2amdcFruKpWKLuwB2P8heFvsqJQgFyI8CTV+gg6XWbwbEfNAW
	fl9P9aYeTO3bEC1KkcuYasO78dlQJiavLGRzdjFIfJhzUqI292JR07WgNwrFOXmahLoPDySfb/a
	S09czzXBjdhLDTi1mCye3xy0N1LK/mgsYv3vrv+00sWm6eAz8OUACMMGqg6HH2GoV1pXvUD4SW0
	kiwbWp0jf/faVcd6OrYSBBo52klu7pXq4S+r/+3K5+IjHOj/wCppp8e8l4f048
X-Received: by 2002:a05:620a:a888:20b0:944:2201:2770 with SMTP id af79cd13be357-9442201292emr1020059085a.39.1793615513928;
        Mon, 02 Nov 2026 02:31:53 -0800 (PST)
X-Received: by 2002:a05:620a:a888:20b0:944:2201:2770 with SMTP id af79cd13be357-9442201292emr1020056385a.39.1793615513478;
        Mon, 02 Nov 2026 02:31:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acd1145963sm3142181fa.37.2026.11.02.02.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:31:52 -0800 (PST)
Date: Mon, 2 Nov 2026 12:31:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Message-ID: <tshclix3kzs4iwgfxjrj46o6vebelntyikhthqwfpoi6muyckr@lhaix6uban63>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
 <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l>
 <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com>
 <2rtrk7tsquxekqhk7tsiomjnfzc3xfqg574cbw2m5b4ui4ovt6@2oxme5w4wsqy>
 <31db3de6-34a2-4ccb-af61-043f56d8f86b@oss.qualcomm.com>
 <4f7tyzvt2ojfmkneoaviegk3xbt2gegp3yoei57rzijcxkrlyp@b32nycxqybyj>
 <20261102092828.3728247-1-atanas.filipov@oss.qualcomm.com>
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
In-Reply-To: <20261102092828.3728247-1-atanas.filipov@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae8669a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bJwWMc3u49Mdhy3934kA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: _ZZBhVDpSAQityNtZ3CmSluAeIIVOa9o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX8D0bshbbqgHx
 MKrJho4BDC+lm23XBzB/X5oKC+mX8yK/B5RJEYga53cXZFEr/e8TrLlDzjUuyEEKnBvF9s2qn9x
 KNCEmUUPFNNvVuZ2BRrYZSrj688ZPdQ=
X-Proofpoint-ORIG-GUID: _ZZBhVDpSAQityNtZ3CmSluAeIIVOa9o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX5AcGfnS9XPiK
 pXtH8vIofQs7rLCf7OIH4bqUrE8gr4XS3UANriRV17pL7U5JVzWwGRDhZYRDEkiPS3oVks3kcYu
 CTFwrsYN1I8yY1IjDasEJlQfIdTTJJRXBCPJwyK/JFHgut9ZclfwQFG1Y1wkpiwkjfXlG6pOOSp
 8oarcZaP+735ccH7bnmDdjXuRkrvS2CS9w5bymlw745k0oYwAe3mNiBU0aR8bXF6ycoLVYH3Um3
 +VYGX8xiDaZG7BK52tuCTydDYKx6dyuH+RtmR5ZmujYxVBNFLkUeGllgTXpfP+XJIzvN+HS8wfN
 eBlhWFzyPPAqUL4XUldyq32Qvo9E8j9/iuttxy2NLSVlaNssdi3LJe3RfpaRLFBLDGUgzq9rr5L
 kb4P+Dlnqz5AaZd+/Uef7vZcDCbspJfT+WFXifS2I5Nt9aEGg671nIGJwwFjCjSYyUzW1EzVblG
 hYMut2rhdKYvRn5g7dA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020041

On Mon, Nov 02, 2026 at 11:28:28AM +0200, Atanas Filipov wrote:
> On Fri, Aug 21, 2026 at 12:36:26AM +0300, Dmitry Baryshkov wrote:
> > This will be true if:
> > - MMCX is a parent of the TITAN_TOP_GDSC (in Linux kernel)
> > - the driver casts the vote on the TITAN_TOP_GDSC using the opp tables.
> 
> Both hold for v7:
> 
>  - camcc-sm8250 attaches MMCX and registers TITAN_TOP_GDSC as its
>    subdomain, so a performance state set on TITAN_TOP_GDSC reaches
>    MMCX unchanged.
>  - v7 adds required-opps to every JPEG OPP entry (min_svs to turbo),
>    so dev_pm_opp_set_rate() votes the MMCX level through the single
>    TITAN_TOP_GDSC power domain.
> 
> > Checking the 4.19 kernel. cam_cc_jpeg_clk_src casts votes on the vdd_mm
> > (MMCX) power domain, while its parents (pll0, pll2) cast votes on
> > vdd_mx (MX) power domain. Note, that frequencies used by those clocks do
> > not match, so we need separate entries at each of the corners.
> 
> Agreed that the PLLs need MX. Upstream nothing votes MX for them
> today: the camcc-sm8250 binding and DT describe MMCX only, and the
> rpmhpd MMCX domain on SM8250 has no MX parent. On SM8450 and later
> the camcc node carries MXC next to MMCX.
> 
> Since MX feeds the camcc PLLs, which every camera consumer shares, I
> think that vote belongs to the camcc-sm8250 clock controller rather
> than to the jpeg-encoder node, so v7 keeps TITAN_TOP_GDSC as the only
> power domain of the JPEG node. Does that work for you?

Konrad started to work on that part, but currently all the votes belong
to the consumers, which means that end-devices should also vote on the
MX (e.g. see Iris devices).

-- 
With best wishes
Dmitry
