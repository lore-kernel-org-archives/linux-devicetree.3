Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5854F35C1B1
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 09:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588315; cv=pass; b=de3g1aznYgGbtmXd5qdwrCDY1TNTJD2jdSko3vMH5ImAVVSevpMduVZliFpFT4aBwe9nstnpJn6N6oZx/j/4xpqfMYMsJdbzGV0MexUJ3AQ1YZSgNjdB7mZjEacLDgk5jqmfLpEzMJ6iWLJFK9RkMl3VmgGH0t9e4fiTiYUnUlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588315; c=relaxed/simple;
	bh=/RX3rQHRs9PtVs0cxd9dcGbugZQcOH3eLVd4N7Lge0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jUkaZRVjLfTM9v+7ermmMoBQ8OLdtPz2lhTTJNbWkMFem75BVmkJPOLFA8Qy1SWhIiTejxZP4Yuj6G1HoYGg2XmCQCBtZuuvILhcS3a4wNR0jnRdlM7VK5WZQ1QrW4OiWxfWWcEhS8zYd8x5sPBH6eu5b0o5xk7frWmiZS8gEOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kwJD3Va0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bxj/cd3e; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kwJD3Va0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bxj/cd3e"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9M7gC1212450
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 09:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BPiJa4wM+ql2ke3koOa4WOH6
	Ghoz+qC0PRzupT+f3yw=; b=kwJD3Va0p6p5enT0D3F3QW2FS+/bFJnN68ccCr9W
	Q+1+DSMYW14B0hTklTg+c6mDONXWr4OqWLfUVM8argAU8VcezIUI0s5s3ABCtsgP
	bl2b++U5ziLih/EyXrczhdYME3yJAb1iAzf0tOm6U6Vrrt/v5kqqgIrh4z/X8N92
	RUqjIOBDLzA+opLFdf14PxwCBCBAkHw4grj7VjPBka3UBeqJUZV9QKgoI7KIWfl6
	E8hOANSrM3RyFLSDLlmvArez18dtXrYQMLjF6JlKY1Qk3pxWwKjs/1t4A9KeERzC
	Jxh1k2i9CWC1SbHAz60ALxd2Pl8gJ5wdQdfHLrQfnSlppg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjkxgsf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 09:38:32 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8881abf79a4so37541717b3.3
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 02:38:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790588312; cv=none;
        d=google.com; s=arc-20260327;
        b=QrenBh5JKV/YoEqdlVqaJ0SozIjvK1Ip5K2f/n+SNUOZ2muyp0BfKRhvev+y9imAqR
         fCLRLSCeaIdoEJhah3l1OpbRVhQdl623ZcMbXv0FTvKgrwmHlhoXk4nG9zoMkSq5NL5A
         oSlV/M2l72rPcKJ1ScrZCkx2HNVE8wayvt02VQ+Xcys+Sh2L0cMJz8YAbIQmOz2c20Bw
         ivpI1aq50BNPRAX0IiCiwNiJyZaWZ4zoBbPHqCqDWOOE8zS2+RwT5zkWsm+yyu/Vi2+S
         XgyE1fmphFkN6ABa1EJtbCMBJY/r2EiQa/Y1vpJm92IyQAgJK1BmS1daTT4/SBRkGNr+
         QxHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BPiJa4wM+ql2ke3koOa4WOH6Ghoz+qC0PRzupT+f3yw=;
        fh=AziZIEfDg7fKScJ6SY+/IkLJL2Uk71ZRq/cIxmG73Mk=;
        b=XyJpg7PTvIMTkpcXHjRN6qT3rIO8lo/QeGTNQ+CdnY50aXJWwC2stm4cTAo0WVGKY1
         q8QVnMX9C0a1hr8Avr9OVlSi2P2Xts/3jL6+eIApSAMAeWnp30gL8cNp0i6HMz7kN67f
         C3a7uIqYOGd3xJaCBlleg9DkVEQ5WuVL2/DBt5HqiFtKjN7pC3J5rrdRczXyTOX7OXOo
         KeRqWbX5tSQzPk+7mgy8+TJYbs8sHRmi+QHupwsLLlMYlrunPjk9rZ58/fyC1rfJ1DNd
         R+gSFXq9IQoR3gxO6YwwbG7ie/Rk07Ai3yxo34CS7Y0bleXq+T5PCyw0Qi5zXV2yJrSE
         GwUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790588312; x=1791193112; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPiJa4wM+ql2ke3koOa4WOH6Ghoz+qC0PRzupT+f3yw=;
        b=Bxj/cd3e11QO/RButch5Czc30+iQc4YBze6Xa1XufUwLBohcfiocW1+Cd3JCwDjMbs
         XTiKKrase7Efj5wCi1irQgSaKEttPeLRnDDz9wBZf8N/tYj2psfr98BwWCralCECJ9eG
         i+yzTF39+OjyG0IBDYZokRVXf25OzXVZXQk9xGqRC19bsRlUrdt4e7KDCShZHo6oE+4N
         CqX7SYu0C0yJ0AsihW/SaLq/mba4+x56sh0DxlsATAI16yrsJbF2vvUqHKgQsGgkxuf8
         4F7aaEkkY/8mgK8A0PU9POFp9zC61JVXLY4cuvr+v6WpIfOLjseg+diAnqumiOHNFLjU
         dkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588312; x=1791193112;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BPiJa4wM+ql2ke3koOa4WOH6Ghoz+qC0PRzupT+f3yw=;
        b=sQEduasmJlDjZvCc7lOPGirjqw92+0w0RBHVGJtn6WYfrPXtV9zwvTN7Bpb/sCghKZ
         G7PxMHpb81i9nhycXqgaAJu0CgoHfVBNqLJTCiOgqmbQUvmltu9MNXGB25DFApdnfOMu
         AAFrirt/tpQMfyXBOUvG9Nxyfupdi7m3IOaf32L4XA6h0fIFLLhnB5hKT4b/7JBKQFxP
         5cZzjsybp/0V4pbo6XYN7fkdQuVimpGhhXqByWdMgVrsJzv2xnPEY5bOI+A74iFu+vS1
         JtHNqB6LawqNAovTiy3M433A212pk96s5LfrZeqoVkMy27zhZ5uyl/mKyx/LCNravcpV
         dlbQ==
X-Forwarded-Encrypted: i=1; AKwUvByv8VIkSiF8mZOcvs8fcC33zCFJXj3sBJnKYJIrOf2/kjd6p+y61K3ghDkI9A/SBH52tI12ayo+0IYO@vger.kernel.org
X-Gm-Message-State: AFq9FYL2cpdwmToX7rlLZqEByX+kN4/sANrw+K9XplG3W4UTjo8bfO8J
	JQzX3Sive9LiuA0E+5AZ93gCFbyCMCj1/ZNmKdL1aQPlcs8bZwFZuoYUBmWTlgNnFAvMuJDsjPq
	s6XXQOF9FY3I0cWtjyTl+S1QJe2Gu6z9kNkqDdkPX00KJsdCr811Cl+/kCZ7mvsVGQy+VmGn6ml
	lKgPy3jo4mpgCruwnt4PpN+WAGm3y7eEbBzRDBO5o=
X-Gm-Gg: AYBFou0Rr3NVLRx8bWEIKCvv7RgZpDRxhuu0IKJZcFoey8vnIJ4k5LwuN8K3rUlkd8G
	kUa0x+Guij7s2H2QfVsDS9MlSp/rvPp9qJCp/aHFV3nL2SnEFGkaCl7VfbIg3IUF2n0RZ9b7N2Z
	CXjpqZXXlo8T5RosEEBQECR66M7kqGLhZ0Sq3YJnxLpnpaSwD0+0ZGWzU2yKc=
X-Received: by 2002:a05:690c:92:b0:89a:63da:cbe3 with SMTP id 00721157ae682-8a649f6fd99mr67447707b3.41.1790588311781;
        Mon, 28 Sep 2026 02:38:31 -0700 (PDT)
X-Received: by 2002:a05:690c:92:b0:89a:63da:cbe3 with SMTP id
 00721157ae682-8a649f6fd99mr67447477b3.41.1790588311305; Mon, 28 Sep 2026
 02:38:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-4-d5b6f056568e@oss.qualcomm.com> <arOe2yA4KOvhYqRb@sirena.co.uk>
In-Reply-To: <arOe2yA4KOvhYqRb@sirena.co.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 15:08:19 +0530
X-Gm-Features: AclHuK8ozZ4LOVya0q4te54vm9li9qjkifPcUO5lK9UE0weRjOvI69Wxbge_Uuk
Message-ID: <CAC-tS8ASR899SH45=mbr+8z6xcOBoRgYJWXfXXER9CUXdYCOrw@mail.gmail.com>
Subject: Re: [PATCH v7 04/10] ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT
 parsing and platform init
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 9oqMOEHQWi3NA3_2LfBqSUb68M6_KRTk
X-Proofpoint-ORIG-GUID: 9oqMOEHQWi3NA3_2LfBqSUb68M6_KRTk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfX3bsQVg0za1UR
 XAY1VjV6ydwiZ6+7HUrqaIyL//XxWJ3z9ccMToQOnYj/nUXZkUhN3GybpkkrsPAkmy0jb3kbukx
 /U+ry646RNVQWdyltXn832x98rF25Uc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfX9cz4iEOPa9Yx
 2//T2aB4OsE1ufe+IfC8QzFadnnF2TDo7isNE1ksRvtlZYwfsO8QJAFidFy+H1K9WV88BocnahW
 9gFhzfGHVNYJtzOawqPIWRGal9bRz5Pj9TDLLHUbPyBXStfegK9VNwfZYPUeztiVbN2o7QkSGLH
 npJF8Ybiw3tnN1M+7ux+ACEvj7vKjKMuYWI058CHik9Rou0XTfUhHlewlQP1Cm/xx6/L/anZZsv
 xMKPLWzD7zeupvEhEp0lwqV7JxCqRXF0KD6g6AkvKAUXr27ZPrUb3xMkXR+6rb9pjf5uFPOtzSr
 MoNxccvmfr/vqbYIOWYVLxzEftCDYJV8eI3ByZbiTffkNWgt0Ldf+oL7A8dB2Wsc8QiKNJMmm3y
 f7eIQ+B1GpG0JMQZy1L+D9R9M9Fm1M1YJD0a5fKvTKJPPAFZQs1mosUveNQ3C10Q18kfHU4+qZ8
 WDRXES3pGulRWkFathQ==
X-Authority-Analysis: v=2.4 cv=QZfzLcbv c=1 sm=1 tr=0 ts=6aba3598 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=RlkvObwyMWO3Bv68wiAA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280038

>
> > +     /*
> > +      * The sync, lane and frame configuration and the MI2S bit clock are
> > +      * shared by both directions of an AIF. Concurrent playback and
> > +      * capture on the same interface are therefore expected to use a
> > +      * compatible format, rate and slot configuration.
> > +      */
>
> What enforces this?
Both directions share the bit clock and slot width, so rate and sample
bits must match on concurrent streams. Would adding symmetric_rate and
symmetric_sample_bits to the AIF DAI entries work?


> > +             case SND_SOC_DAIFMT_I2S:
> > +                     cfg->sync_mode = QAIF_AIF_SYNC_MODE_LONG;
> > +                     cfg->sync_delay = QAIF_AIF_SYNC_DELAY_ONE;
> > +                     cfg->invert_sync = true;
> > +                     break;
>
> Does this line up with the clock inversion in set_fmt()?
invert_sync for I2S is set at probe via DT parse but the INV_MASK
switch in set_fmt() could incorrectly clear it. Will fix it in the
next version.
-Harendra
