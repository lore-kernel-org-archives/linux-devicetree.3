Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A9536A366
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805360; cv=none; b=AEHdF+DmC8RMRc+de0Xtqw0qBhlf9IT0KwN8gl4v5l1cYENiap53+3fK5MzThuHwvZGQq9CUvKDVVjq5gcLuk9LkDkGQW5hwZIlbWaQ2wpViqOtHmeAIqx8vulOmOKrV0XwkRwKWL9uCPu8l/gCTNHGvtOk7pbMTH72cgrP/ZdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805360; c=relaxed/simple;
	bh=wUO9hGeyjWgq0u4+I/+vR71BxdfM3TdokDN66TF+0oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mq3q8E/mTN87thuy7lZ++q7PlY2K+diFVOPr5gN1ip5cCCh7tLjRnTR6sk5Nm0svmovwgU8/ouyObxEpAobsmYYV3Nj1HPqKcdGielmMa3Fh0n4b02qvdOfN7Zns+MeIukvB86aMBoKv7/8lb79dX7sw7ekxTyurR+uApyebo+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJ3ufCCX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N7oMYpLX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJ3ufCCX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N7oMYpLX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CKA21088634
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9OVOpxViNJp6xIYKCtstlSpF
	T5v5gqax+pc8jSVAyno=; b=nJ3ufCCXNKcIKrdOKM+JOcsF62e9fw9OeNYqHLIQ
	Ev3OXyz2WlUUhMG6Wr1T5Erx1JDO8QtIjxemN/+ICrVhUdKJdSWSD+HeT+TVM1Qh
	R83hAKIE1JaUYaUKodIoTYjej7uRBVeCr329xaX0EV2fHV2H1vOe09ENoV3xE+yX
	AqyV2SvF5yOmE0yqoHXGnN7OoIIwKUvha011IhSO5EtNSKl/IMsxc9o4TkD6cn3A
	r+1ae1avX+1qNw3R7GdfW2b9xSxBap+Wif48YDU7BwSs2PIm9FAaDKGth/W0FNkv
	4k8NcUodRanaZH4546fdA35F5Briukl0C6h6DgUP+4E1og==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f462fgxpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:42:37 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139af2bd2c8so7243401c88.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 00:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782805357; x=1783410157; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9OVOpxViNJp6xIYKCtstlSpFT5v5gqax+pc8jSVAyno=;
        b=N7oMYpLXf8b1HRxYiiZ0KL79JmEQXm+26U+4phQw3HW7Tv9K2UKugt8P4S07KhC72J
         /qB9yEWe3m6EWwVsX3g/aB4XaskBT2w4lv4YSwgZ62J/ZHexxUXE0ONc/0Uo+QKIOjG6
         l8COwMzfS6mfve8A+uBPQypMCZ0Gb1gg+AjksT0vDSO+3k43xIQ4Uyd5NDlUrSuxssRw
         LjUBYVyriN8q3qZgk7amFwwwyqiv9NTG6mxPntfB5I0AOLNEDyjzeTBco8EW3+pD4LC/
         KkHeVad2x0OxqFkTHEwZoDZWEqkTHJKJIsOptt82T5hyordH4QOx60LM4QyzE58lKNnD
         34cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805357; x=1783410157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9OVOpxViNJp6xIYKCtstlSpFT5v5gqax+pc8jSVAyno=;
        b=bqQF5QkKwls2L2Xj5YbL3ntSvc48AFol0fyBVXEOYneFxDq33SqY9cBI/aLFncqv5n
         AFY2hTlZuNibyW76U6j0M1QiD+RJNOeCUmTk0Wp1ZYK7/5MQLFHgD5mVgEA76wQE9pN4
         lEVKHhab0IA03TuzacY+lvt9h+dtAwJKEan2pYwNJEFCleGh6Kzwk9UTchS1vbmTGJGd
         UOJcu8eRu+Lz8bOvdtm2/QMg6NvnScsfbqAKZcgqLsjpeTvojeER6drU/5O6GynK3vZY
         ZXuZ13ch6Oh+GLFFqOVnUDu7W72Ybryi3eb9kFq+5LuFB0WEdSfuLGVhXL07flr2Qd/e
         0uVA==
X-Forwarded-Encrypted: i=1; AFNElJ8NFmvyQWsDe+Arsa3IGKnbsLrFr4MhMk3NSvnJse+d7Ov20c6F1jKetB0S0mymxt548M16mFiZ6a1x@vger.kernel.org
X-Gm-Message-State: AOJu0YzDbCfUE1RkQqTRH65TfV6C24451E6RWpvI8Sdnwka++K08m2nI
	HxwevsIR7fja5aa0XXxHh7EEeSJFS/Ktl1NdfEhoFbajTGG/1H3ZiZaoXGvLILp17C0gFxJa4oY
	8bM4+E1AO29AwYh2x2hnsW5MhGONGGsJHKubIyJFUIZjo0DG4gLfDM0FvkrKG1HJr
X-Gm-Gg: AfdE7cmHjKW48Yg7NGJEO77eFOxxZ4KPSSiWPeWDbfxL0PlTOJxZH0lkclLcxZ5V9KS
	I+TmhxCODCxOyBc8SP0N+zrnCm3xwllo/is95YEmox5sz71LhpHcL9RzFITzdsvEHYtXGy3kNfk
	zyz2aakL5c8fSOouwcZ0F8KPEwzOi7QUEGuRjuzicq27F19XqVHK6ixYnLa64ZZaTIfkb3pwtFn
	5w8BgtP68N5HF7P7sssykBuJWRCI0azSk9miyzOHbKKPOrrqUBJzkFb6CpRJpq8hU3U9SCXILbX
	6hU43QkvSzLtmWWx+bLr//c2shAcvw56PkQ1avAfSAPnDxB/QFOR3c0AhZQnpeW6eqcMtdATNAR
	/14DWtlfW7bExiLHFxFUCvcyu2Agi6N0BBLDsxXmFD50fDOhL1ZgOHUb6pNCKZvr496sPS7pBJf
	p3/OTpgsymiVjsvCARRZeVdjwKO8aSSiYxd/AGtG6q
X-Received: by 2002:a05:7022:117:b0:13b:20ad:b98c with SMTP id a92af1059eb24-13b2a1c0a81mr1576980c88.30.1782805357004;
        Tue, 30 Jun 2026 00:42:37 -0700 (PDT)
X-Received: by 2002:a05:7022:117:b0:13b:20ad:b98c with SMTP id a92af1059eb24-13b2a1c0a81mr1576953c88.30.1782805356480;
        Tue, 30 Jun 2026 00:42:36 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab0fc83sm4253429c88.3.2026.06.30.00.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:42:36 -0700 (PDT)
Date: Tue, 30 Jun 2026 13:12:30 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: qcom: Add IPQ5210 APCS compatible
Message-ID: <akNzZukjL0dCCVpO@hu-varada-blr.qualcomm.com>
References: <20260629-mailbox-v1-1-3b75ae87c4b5@oss.qualcomm.com>
 <20260629-boisterous-lean-bloodhound-ea0949@quoll>
 <2068d47e-e201-434a-816f-27c3fa5ef889@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2068d47e-e201-434a-816f-27c3fa5ef889@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2NiBTYWx0ZWRfX5ww52uZgvImn
 Ftey+lbxGFjZTq6pWVNJzibWi8YF3dVfdK0xKOx9HPPacdGM21MOiEW8fJJ3dWox2IYTX+Y6KsB
 eG1sVIY3xJGgbLWLW4fM55V5S3NuWU/IbMQTSwbZ4ovVKz88lpzCsGbgCQ452vfDOQC7aPBUVWh
 eujXZ37RGLbS9QOy7dWLvlPeNgqI+My7U9sb57rD2Cgm1NAuU+iQPYtOhCXujs7yj4sQYo7PCHs
 l2ShIX6zBmfrwciIeBlrMUQHP7Ojepm3W4/qoY5/F5JMlFapss6xt0GyNXir6GbLdZNQSA8uBTH
 mFtYQY3npm5Ark28JP29TjQJWwwH5/LUKha2HgVpHyH6YWOkuYYKlMR6shRFZ7ZkkKwHnE3EVm6
 xagq1G8tJ/ve8L6Qe3fOdXmkJJLN1znCW27YQ1OOKUgdgV9eV+MMAA/VVmRFrIADxykm2iUqzGE
 rDwBmZNOEbwhGMkHD+w==
X-Proofpoint-ORIG-GUID: dPMYGVt_Xpz5DKu3hlqVIiGMy-cHxLBu
X-Authority-Analysis: v=2.4 cv=JqbBas4C c=1 sm=1 tr=0 ts=6a43736d cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=5kZnj-dxASKV5PTaM3gA:9 a=CjuIK1q_8ugA:10 a=s5zKW874KtQA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: dPMYGVt_Xpz5DKu3hlqVIiGMy-cHxLBu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2NiBTYWx0ZWRfX+cnJR2nQ5VjA
 waUjcYXzoaL+u1KGlJfhFqLoBWt5JhIEUXG3oW6t/gB4v91z79PcwxN+xTy5By+h33kZtbW5cpD
 h18yqDz2MxsMvYI+GORkdkUAlIcReuA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300066

On Mon, Jun 29, 2026 at 09:29:47AM +0200, Krzysztof Kozlowski wrote:
> On 29/06/2026 09:27, Krzysztof Kozlowski wrote:
> > On Mon, Jun 29, 2026 at 10:10:46AM +0530, Varadarajan Narayanan wrote:
> >> Add the APCS mailbox compatible for the IPQ5210 SoC. It uses the IPQ6018
> >> APCS mailbox compatible as a fallback, so document the valid compatible
> >> string combination in the binding.
> >>
> >> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> >> ---
> >> no cover letter contents, it is a single patch
> >> ---
> >>  Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> >> index 1b4ef0688ca7..39bc374300c3 100644
> >> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> >> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> >> @@ -19,6 +19,7 @@ properties:
> >>        - items:
> >>            - enum:
> >>                - qcom,ipq5018-apcs-apps-global
> >> +              - qcom,ipq5210-apcs-apps-global
> >>                - qcom,ipq5332-apcs-apps-global
> >>                - qcom,ipq5424-apcs-apps-global
> >>                - qcom,ipq8074-apcs-apps-global
> >>
> >> ---
> >> base-commit: 533704f3c28c3f5f9e2542aa3a6a326c32e6f5c0
> >> change-id: 20260625-mailbox-01f977bcceec
> >> prerequisite-change-id: 20260625-apss-clk-ed39c40ed468:v1
> >> prerequisite-patch-id: d9efdd8a09b028b1343243c5f0e78cf3e8b1e253
> >
> > Same author, just squash them.
> >
> > I already complained within Qualcomm about this more than once. On the
> > mailing list, on the internal company-wide open-source channel and in
> > person now when I was in Hyderabad.
> >
> > Repeating the same is waste of my time, easier to have blanket NAK on
> > your patches.
> >
>
> Oh, wait, this is even messier - when I look for these in lore, it
> directed me to that patch, which I took as some other work. That is my
> mistake, but still problem remain:
> 1. Dependencies are not easy to find.
> 2. The clk change-id is found and I do not understand why you made it as
> dependency.
>
> You are not making it easier for the community to understand this.

Sorry. Apologies for the inconvenience. Had posted three patches in the
internal list

[PATCH PREVIEW 0/2] Add APSS clock driver support for IPQ5210 - [1]
[PATCH PREVIEW] dt-bindings: mailbox: qcom: add compatible for the IPQ5210 SoC - [2]
[PATCH PREVIEW] cpufreq: qcom-nvmem: Introduce cpufreq for ipq5210 - [3]

To test the cpufreq and thermal sensor based throttling all these patches
and the tsens was needed. So marked them as dependencies. Since there was
no negative feedback in the internal list, and the files had different
maintainers assumed the split is correct and posted the same for upstream
review.

Should I combine them and post?

Thanks
-Varada

1 - http://shc-kerarch-hyd:8080/kernel_archive/20260626-apss-clk-v1-0-8c423d3cb94f@oss.qualcomm.com/
2 - http://shc-kerarch-hyd:8080/kernel_archive/20260626-mailbox-v1-1-24b766dc2ebb@oss.qualcomm.com/
3 - http://shc-kerarch-hyd:8080/kernel_archive/20260626-cpufreq-v1-1-0a1f26d5b734@oss.qualcomm.com/
