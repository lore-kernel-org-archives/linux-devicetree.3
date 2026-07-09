Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAF03AC0CE
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 07:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783581490; cv=none; b=ZoCiz/88JpXhjLU3k7+jxSAnUKGdtAfZgVo6ciUi/1RLytewH0INMwMPsKLJ/TrkkrNsvvpm8PDQzRfyEUq1jn1Bmy92s7lrOrVj80NfbOESB4GGihgw0BuMDqJ36hR5FQs65x+4y1eYq0XqxODAy3Ws0ISbTxXl4GT5vjZomNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783581490; c=relaxed/simple;
	bh=18vDcgNXAmVBtJKzmgRz/Gf5nUM5g4meCTEo3uDOccg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xp/DaWRZ6KCYVf+zYHZ62k8MmOgVodCZ1C2erzdvPzdtSGQv5bJb5oFelmWIi2S3a1BRnExmGmU4DCHxKLwERqqrl0d0AvQjn9SKG9VoidxkJTLxpymQHa6xst7lHcD/AXUo9Lw3o5WcDGHkbPzs3mPdL6aqx5elis7AaZaPWAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E8ZpYNzf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JqR3eGB5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E8ZpYNzf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JqR3eGB5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66961AgA933402
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 07:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3vhYLpK9v1e6+EKfY9vPvoKy3eJ8L7VUE+wq+TWyHRs=; b=E8ZpYNzf/q6Ln8Pz
	0xjZX6+IrgoNYsv0ZuvoWD7B+bD90B39iBPnocHi70ZVyfeUwLeDEtM/jnjOzukE
	bV/JtolPzFCunw2ER6O7nMws58PHhPdv+myTcP8+mKzMiOWt4OZ/LQvuvN62bI0H
	xprQOJa4egfYd21oU3qgyYFXp5vqmNbjioRkiVqUwjXbe/kuvDz7UjYpbZAqf4zw
	1JY12HV3HphV3QmdWcEWzg93wEDhZeNBMtVju9zPSYd6uy6ff3r8FaOgW35VItvf
	vHMDhoRM8Cju4RBt47M4VZtTLENARfIXDtMyzwnNAoMpOW0RmKQ8VT8+KXdxPNkZ
	tyJWJA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6jdmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 07:18:08 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5a83b662fb8so1655017e0c.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 00:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783581487; x=1784186287; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3vhYLpK9v1e6+EKfY9vPvoKy3eJ8L7VUE+wq+TWyHRs=;
        b=JqR3eGB5oW/pUsSjKaStr6WqPS8PVE212eVQognAW4/sqMEGqSIMEGn1W842rzqLjV
         vFNjk1h0gGMLvmFyUbv026cojFjT/cAe/ouWokQIltbUqkhgCEhkPpwcv/i0u5KM7Ob+
         5ZAm2mK7iPHn1OuIlByoCMerhIFV+1XuSiplvhWTHlYkIQrkSE9TZbwB3VJRFabUTNH+
         sTsrqx3tcZZPLiNQ1MQMPBshdVbCCcwwtNF3IK2ku5c1mr+3d0BBSTWD5OTmKtyfiIjY
         OenoOZl99xS62lojvcrG99Qs664ED30mVvZrICvHYxPaGn0d0yazijwJyRikJY+qM4Jr
         dh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783581487; x=1784186287;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3vhYLpK9v1e6+EKfY9vPvoKy3eJ8L7VUE+wq+TWyHRs=;
        b=PutsRp913X3nG0IjRvtchKKzaFAasbnyEUpfUNA+1NyZlJPQo6F+iQaTbfXq/5ujgn
         w5+o0VoGVedKu8oOPemfE9b2jDP8zG8Tg0JeyxaZ+sRrDjFBqGR40iXYQNUGiSSEXRZ9
         kqoy4jmTSXDwoG8Vr5MkfJJ8Uqxh6p3FBuNugVTmjlrcH+MiCUGwsWqO3NlP6zqOyMP2
         qUx/ymqMwgSSn+f6VMFSCoyQjQCHs7bNvRvqYexfNjbOSu+5+ft7MChZ1vmdc6iQRaVZ
         zyDrzMuO2UwpDzfYtTpilql/1DqzpSGkStNmo3DoZtPAAkCNGdbSutDv6GP41SyTM1zK
         QX4w==
X-Forwarded-Encrypted: i=1; AHgh+Roa76STMj58URVcNOyZfmbd1RTRradLHWrBzt5BHDR9Lbu5lIs8ugaGrn/ZzoKM1xxuqGyetuIybCSv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+3fjujboSXITznfrjQWVLiFavyJ8ud1MVOB6V24UtxX9vt9nn
	Ib5bm8ziMuNQlXNS3xc+AOraRjpOx4sr/nK5tgYIBzeXJ7DP4PmHq2UG+kHVa/DcW8RxlhHxrxK
	BsrW5EJcwDMq2eQqrAybL2C+NsxXnA6BBrf272FsKwNQYojnMF1f6MWYEo7QLhufj
X-Gm-Gg: AfdE7ckfuD3hugz8oX/t4wH9cRg6H9xL0P6TqkCjG5sGspU10wgYMmk1pDKrBzyiAQS
	DuC0r+xi6cYmL5+IeXgBQRGXPlkDRaSoQngYEV13IxVUlBLkFJpXHHqqOk/BrLKri7pU4w72fB4
	nLpzbs3sma9rhsH09E2QRK9GMQ1eOU8mC0jDmY5zzxgu744oIu+xb6Ar6HLEkhlxvUiRc69spqS
	XiYmU5Yup/F8VDtixb8lEGf5WoYJjIpFWnZFcHfkcWy4bZUeapuafMcXyB8utM7wyZllwMArGYH
	JecmnfF9VAv4BgAaIPmHAWixvWV3pce0F+FmgB1E3qoC5t82k3+P4JM1Djyx8TQrHzSZ3Zx3d0U
	i0b3NqLNOyn8IimfMqqdL08DUJagHTnZ8OaTYw3lDx8lcQ9Q4I07We7g+b5f01QqQZLy+vo16j+
	wKCY9MMX0E9uyRM6y8bo6JfqLY
X-Received: by 2002:a05:6102:a4b:b0:73a:16eb:ac94 with SMTP id ada2fe7eead31-744e0327293mr3587697137.19.1783581487323;
        Thu, 09 Jul 2026 00:18:07 -0700 (PDT)
X-Received: by 2002:a05:6102:a4b:b0:73a:16eb:ac94 with SMTP id ada2fe7eead31-744e0327293mr3587662137.19.1783581486728;
        Thu, 09 Jul 2026 00:18:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b12f59sm1999841fa.10.2026.07.09.00.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:18:05 -0700 (PDT)
Date: Thu, 9 Jul 2026 10:18:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Ananthu C V <ananthu.cv@oss.qualcomm.com>, conor+dt@kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
Message-ID: <qek6vh2xcc7haiz7w2qdsfpglewxltbpvjedijqnf7bev3iux2@x5cqyojrwjh5>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-3-053993f0c6fe@oss.qualcomm.com>
 <20260707102536.0055F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707102536.0055F1F00A3D@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2OCBTYWx0ZWRfX6h3E1sfYPYud
 Y/D3ZMwAPkIQavGGLHlxN0vM5pQozufdM5BklNG/SK0jkAruHQ2NjG+W8hJwEMsAPIUKgNxCn3+
 7+0opyvt+t6kdHP34L2cHQwcDJG5O48=
X-Proofpoint-GUID: IoDTu3-sP7QD3M9BnI6U0CD7Oj2PsCTK
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f4b30 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=m4A0djz7JSd1O-oJfEEA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=hhpmQAJR8DioWGSBphRh:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: IoDTu3-sP7QD3M9BnI6U0CD7Oj2PsCTK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2OCBTYWx0ZWRfX0CCGzKsqvBPU
 6JbaMpLNJJOk0+tTs87DpB8NR9RLFqmK+GDwpR4p4rKDKiWaBQkKVMjzy4dx/3t50ghprWQvdZQ
 bWgdfZY71lkmJljpXGtPX2F/7txaokS14/1mZ0AWIbjqvoxaSzt25fsj2u2I/Zc8oKE2fER5d7q
 D4O/7OF+NXblkVrCmc37HNnYrzRibnAPl8oRHHbq6uZpNgQG5/kIYSA+XQ9phBEdRP3wOzFhTwO
 OT9/IStfcgBztpXDnfMlvt18JpJSvy70xqxM7jcZY1Ho1+KtRVdL48TEtt0sRn8bbNYdaf981i4
 0qJE7nLiH3fIVQ+XrCgBZScz88M+Tp/GEywR1UhiWfcPxkCpW9NREf3x8v6rUiIcTW0lqb0kpVB
 uJF/R0ug1Q4lb7GOg8IZ46ODuYO1esYPXx7enrBZ5Hc5OvSje77azJG7Uk0wggRle5P+dDt3akg
 +6/+3kBbjLxzb1Iekvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090068

On Tue, Jul 07, 2026 at 10:25:35AM +0000, sashiko-bot@kernel.org wrote:
> 

> > +			compatible = "qcom,glymur-soccp-pas", "qcom,kaanapali-soccp-pas";
> 
> [Severity: High]
> Is it safe to use "qcom,kaanapali-soccp-pas" as a fallback here?

It doesn't. Please fix DT bindings.

> 
> If an older kernel lacking the Glymur-specific match binds to this node via
> the fallback, it will use the kaanapali_soccp_resource which does not set
> .needs_tzmem = true.
> 
> Since Glymur requires TrustZone memory configuration to prevent faults, the
> Kaanapali driver cannot safely run Glymur hardware and may cause a fatal
> SMMU or TrustZone panic during remote processor boot.
> 
> > +			reg = <0x0 0x00d00000 0x0 0x200000>;
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com?part=3

-- 
With best wishes
Dmitry
