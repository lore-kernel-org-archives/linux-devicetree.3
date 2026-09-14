Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C44C438488
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386103; cv=none; b=reTb1Y03xYnHUJvv53Nn2rWxssJ0e2vCSAh8fLiAd+1ZyoTksDX6y1cB3jvRc5b7KTpUW9oCHhFpETu9hitPJQsAQ/rsEFnuzOaTqiiG6vkvqFnQ7I7TwRihMAICcoaMFPYdCm0O4klt+Gr4opjEKXB2CwizWPgl3oIZpfP5jo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386103; c=relaxed/simple;
	bh=bMyaj79Xj8SKgL++6asrV1IEx4PQu7LtkneHOHihzcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lf/OSy2OKEVYgwdMhM2BPWm90+ARMQV9KMTSNRIeu9xntHvm74iSNDho4DlMw2081xuQyr1XcVa419cz2ZCI0psdZZ/sASqA8T1rrQ6UX1uCBFhPuB2F0lzeN3DuWjAYYzUH2mj+QhKgf5C8TSrbo0Xizy9o0dLDIvrVijBJ7/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZQwNE3rv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zl5K2EI4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZQwNE3rv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zl5K2EI4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmfI4216046
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q4hZNtHH206ssQDtYMttSBtL
	e/TkFZ2gK05kL/0CYqE=; b=ZQwNE3rv2eCOTbg8qNXMeTGZWJfs6OkRhnoAH77j
	DfGFeZaWw0OFJWGXpLVGKFjbOCiRoz7KmcsWGcfpCchFzHxqSdedOWsX3B2an2VH
	hShiesPjDwxJx1Edu68NOyZRtv/MT23foXa1WwcU2vF1zUxV9LYCJruVryccJhbH
	4xEAjcRdPWOPtcNTvRUkAFZsys6Yh2OsZdvxdLAuKqlzSNJADWAkXD4pRWtcqC9j
	9M2qRR8oT1Ba1blWpISf1RcvNjYdttDkV8ZfpaYLeTbTMPM6j2ueR/MiUfaX7jp/
	V0ZkEbyasEAW4VTxxR4tOVHIZ/4uFEpZ8MHTW4pZ8DNRvA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9deetu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:41:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939d6c515deso635789585a.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 04:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789386100; x=1789990900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q4hZNtHH206ssQDtYMttSBtLe/TkFZ2gK05kL/0CYqE=;
        b=Zl5K2EI4FTbyBIaphb7qJoCv+Y+P8NMvbNV3TbOQ9OBTs0ChSSRj0hUHuAGjONigGI
         XijrDyUvTyIL/8LleffNOUAE4oIjliC+tMdNpnyY8cq+HvC5Oh/rz+LSSPHS2HxQik7r
         Z5y1Db3c/zqTEdcvumbDRPIfdU2+sfBViEMnr7ISt17JsbXG8cKg9IPjotXXm2s6IJMd
         9p/mVtoRXlo1owsYb8h0Mw/K2B8KeTkFWAfnhx7+KutBHkt8GtJJcbRIX8nWts+vd/OD
         yEe2CZdBTarZ7iwQym4odDNJYkxh9lo41Ue/jrbTvk2ClhM6eyKMqHXTEGqrVk2i3kSl
         FOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789386100; x=1789990900;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4hZNtHH206ssQDtYMttSBtLe/TkFZ2gK05kL/0CYqE=;
        b=IMXayEHCLA9R98uhuQm94Ei8SmcUE23BVNE/UI3frPRh5x6kVATVCoqGsm4XTiaAD7
         DM7XVOdFtkJQLnC/gFgKX5p+t/wstEa3o07/aL/XTVRf7v2yV8rHbrms/yttJiQVPgvH
         O0MkMgIOs2cbUrPvT/AKkB23Faf73MYvu17K++IdX2ZmyfawQ1V9E8vgabuRETbKYmcK
         qjCxYHLXRRxeIBYrdyN7p8dvynQGNwjhSH6crm99vBAvdP//SMC4h130A+JY/n6aPEHa
         Lyv9etTH+/D1+NGPoyNfsGCQRpwEhxwv0YIOhzjoMbj1uN7LpwfHqYLdH/WfmQLAtDG1
         KQyQ==
X-Forwarded-Encrypted: i=1; AKwUvByOWN6kb4mxJhf6JCFcZe2i4qrxuOrjtZG5CBt5+Rnaw2g0bKeo5hfjkNIloeJ7VqncFw+kxAb9pCRN@vger.kernel.org
X-Gm-Message-State: AFuF++laMon6tBQZF2lFOadu9S+eFdW5+DAOHiWsFmNUyzcyNzvZ6bs+
	d8R7yp/0fTjWAiSOKicoV76zxDwcLuNavFgOJMfy0/nPD/C7Owd89ocBV0TwwRUj/BbqCPv87SA
	c89Y5gmyjoQaOMyrqZdGPMuuYauH3ouCpP69ZrRl00Jqc5W+jPbR8r7Sfp3hx+0sI
X-Gm-Gg: AYBFou3d9GqsiKWebyrc3X2g1jzqjyQOGmcNbNaMcp4jvQdb+0Ka5IG9TnCZsy2lKvW
	xrld3wpQ6Lr8Df6d2F4pM4aYJ3g247cKmUJk8lJgtXUg/lWr42i7qsVFcREj/0KukF5ZN8IA27M
	pj6EPll8Vk2ypDFLRJCnNFAAU39WNV7I0vueheZFQq2OJc7vt9PkIvf4HySdATf6zY5Ef9MwrNk
	AHRJ2E4UQ+BwRq1IcZqcrNIjjXEhlnFkJRLn5gnrbP8Pd52JYwb4dQXiaup2DHvaIETpuQeWABR
	6PkrVyPJcPs0AaJbjsVWcKIzT010xBdTHjAQL5unbL/eo+GYPO2wMBl/TffQlrjwdP/18VQbMSt
	gme9+gFL1jnEOxg==
X-Received: by 2002:a05:620a:470a:b0:939:f477:ffc7 with SMTP id af79cd13be357-93a297cb926mr321949285a.5.1789386100092;
        Mon, 14 Sep 2026 04:41:40 -0700 (PDT)
X-Received: by 2002:a05:620a:470a:b0:939:f477:ffc7 with SMTP id af79cd13be357-93a297cb926mr321944585a.5.1789386099459;
        Mon, 14 Sep 2026 04:41:39 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34f1f7sm26189080f8f.24.2026.09.14.04.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:41:38 -0700 (PDT)
Date: Mon, 14 Sep 2026 14:41:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: eliza: Rename existing EVK to
 suggest eMMC
Message-ID: <bvku36cnoyfo6kx4rbhzx6avzoje2beaio6ohziy7hegmbwtly@42sgvqmatigw>
References: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
 <20260914-dts-qcom-eliza-add-ufs-variant-v1-3-78b3249eae61@oss.qualcomm.com>
 <20260914105243.682101F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914105243.682101F000FF@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2NiBTYWx0ZWRfXyJ57jXs1v399
 x6EzLQwVIvCwKB/kd3T68OxqE5ZjL/5C1l+a1wFgJEepWHiuNSBSK4yk3OeWjJmqDJSQEz9Ywuj
 o5HdUl6BM5lObS+aJPF4WNmgemHAXdRDDldrl1KlO95Y7rV94aRGtUak3D7XbkWV3nNxoG0fqwO
 /0fMbQTsiduk0XHYMaz+RLUNIaJZBlsg375lPgYr6LqYCLF1wxdAlayJNwIkwR40Z+sH4iEUXIu
 kqPyd746g2JFTB/jGd+YZd6/82xs90ift8f6k8DtLaMJEbDkPPmceJ1Yu/25qcHGB1Q1pssMJnz
 9PfAkxPaAaGasXx9v6t/R5GO4AIPiGc1xSt5WIjIZe/+9P52Sh+n1rcA+HY/c08K+OEyXS7hDeR
 /wlHIbhqyiMHY3BqE0x7b3ZdarYdHpicgun4S+nPk8p27G46Z16/l+pxZAcdYzkI7fPFkNYtUad
 nCj2c1JtreCjwc9+JOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2NiBTYWx0ZWRfX0RBiMU3KM6I9
 pT3o8qBNSSnM3RK1yS9PPGGhtb0ck+iauYDGf8gt4GXSSOyNrXUjgg71Tgr8sr2ncabrAjtDXzu
 BSUMepNaoEpD48v707y+Ne5U2s6+ack=
X-Proofpoint-GUID: 307VdJSwM1DCFb0BDVG15xuHd0UWEzZ7
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7dd74 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z0zxWqUZ7HtY6bVccYkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 307VdJSwM1DCFb0BDVG15xuHd0UWEzZ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140166

On 26-09-14 10:52:43, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The commit renames `eliza-cqs-som.dtsi` but fails to delete `eliza-cqs-evk.dts`, leaving it as an orphaned file that includes a now-nonexistent file.
> --
> 
> commit a1174aba52e7db785b4c5053b74679986a1f1e7c
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> arm64: dts: qcom: eliza: Rename existing EVK to suggest eMMC
> 
> This commit renames the Eliza SoM EVK and Eliza CQS EVK to reflect their
> eMMC support and differentiate them from a newly discovered UFS variant.
> It updates the Makefile, adds a new EVK dts, and renames the base dtsi.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index d6547fb18edf0..ccaca98ad4c8f 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -14,7 +14,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
> > -dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
> 
> [Severity: Low]
> Does this commit forget to delete the corresponding eliza-cqs-evk.dts file?
> 
> While this file is removed from the Makefile build list here, it appears it
> wasn't deleted from the repository. Because this patch also renames
> eliza-cqs-som.dtsi to eliza-cqs-som-emmc.dtsi, the orphaned eliza-cqs-evk.dts
> will fail to parse since it still contains:
> 
> #include "eliza-cqs-som.dtsi"
> 
> This will break any tool that processes all device tree files in the
> directory, such as running make dtbs_check.
> 
> As a side note, previous concerns regarding this patch dropping hardware
> configurations appear to be unfounded, as those configurations were safely
> refactored into eliza-evk.dtsi in a preceding patch (commit "arm64: dts:
> qcom: eliza-cqs-evk: Move sound card support to Eliza EVK generic"). However,
> the forgotten deletion of the obsolete file remains an issue.

Yep. Will remove in v2.
