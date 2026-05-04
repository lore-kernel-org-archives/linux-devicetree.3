Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C279528643A
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 06:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777875920; cv=pass; b=jFgtgYd6OuZdLbEq7fvh0zU68IIW4fTTous9xTk8AmuOltx7Ov6h4r4DNkhNT18E+rF7w+wlKWf7Qwoz8VeBNn+jUk6ChTBTJT6kwuj/IkYpmBdBZJhMVFDC01w1OuLPbfO3ejchgmbCHml48m50sDEka0Lb/6KJ4LTNorVpuck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777875920; c=relaxed/simple;
	bh=Kr3jwdRxaBtI40R+rmJsDENRbmnOH5f7Z3o6bDWB034=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qnA3TgRwxSmO+gxjSpHAqAdk7tylIx7EWUgUoOl9+TE2w2mr1dC1/2KQv57IF/R2Wqmj/qyYS77o1gIx9YQZBfs4684PMlwoa9wo+StiCz8R+bFKcskPkAYIA3zN+KKEYBARE2NlOqSzT0uA1jfmlLHV79eYRZ3E40UYHd+tUDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLVqXhPs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gMQ5O0Dz; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLVqXhPs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gMQ5O0Dz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DCBB3548538
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 06:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kr3jwdRxaBtI40R+rmJsDENRbmnOH5f7Z3o6bDWB034=; b=CLVqXhPsboOUV0Sb
	qzqJRCnYEcb4JC8rL3rOhU3/B1TlrB74U3r9OZAnVoEaFIiCh9qfw9xvSNMqZke4
	lpD/7HnHTa8dt9Lhw6gYz6hYP0Iu/KLfi7yvZphmynn8FXh/7oWjGDRgztHREuno
	qPmYcE1ym8VFiT7p7YoyAn2Crz/oOlGqlk4h/3Fh/lImT1Hno9mn/5FIkHO7PooX
	cJa6xRicxBQqxWugbgxiCqWTs+Kcc2XiU+hv3vrjXRGv2HqN4J5z+VXI9SYLaQLH
	Ggd31QbVIp2W7PQ8FCIv5hDDrEREiHztd3bUPN/H6woUPHyZFUQOZrzZk+/K0ZpW
	aWy9Pw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw6mpcr0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 06:25:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8eb21daf7ddso759547685a.1
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 23:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777875917; cv=none;
        d=google.com; s=arc-20240605;
        b=OYuliob+/+NM8QQbKmN0j1gGtli1kjMnNzIDzQCG1Vwo1y+B6p62WlFhUoZkRcdmmY
         01X+pUjsuf/et6YWsehr6cnkDbacLKgLOUQ8KnWbAQO2uMMem6wURi3v/PKscmZWn/TU
         s/2c658iQHxWHOty/+Vsef4943VcBMgFUyGjqLoTwzMSua1SAZ7Z3RoBKQfJmzmkzPrT
         l9OSSQrri99tnimNMcI0Gd4/HO7t+/71YhhZN/d9lZeCEk3rj93xphR4UE478Vz4FT2C
         h4gtS7YyRtHGF6Po+2lhFy6aCBXKt81gyK8QTUENe6EF9znS+vD7GZ1kBlJqCtlyUsB5
         abeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kr3jwdRxaBtI40R+rmJsDENRbmnOH5f7Z3o6bDWB034=;
        fh=CCwJ4UZyG3UsVIK1RTSfy0Scqkd9WME+/v1TmTqaVLs=;
        b=kyaeVF4eAaF7zuby9XJH8QcGRKsjG4DxmA9K5txD5YaoSoEKESyo6IQKc0/0SW+bF/
         UG2crcNd2UKVaxodsKNaV0x3cSppCBO33TvlbAYaoq+L4I5sV0ySTDNlkOm050UBYrC7
         w2trEFzpHOElwKfhQks5XMfIAuVE8NZ1f/wf4TpSjEAuRDGrngb6tOAAEG1C+IguCYRI
         kqIu2Z/qEVq4/QjHTaWn0ZXSw5kbGx+V/5AIZ1qa9LxYD9RimVUtrHoFFr7UtA1AaMIk
         cZUwY4HZpBKhfgBl+i1/l3xFbZ5+lJqwqtuIBUGg+OGlI9xhVnaUUHWXnFKfp0t+ybDQ
         s4fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777875917; x=1778480717; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kr3jwdRxaBtI40R+rmJsDENRbmnOH5f7Z3o6bDWB034=;
        b=gMQ5O0Dz6uRoTEtMw3SORZokOjZYsgMFnOpspmBxdF2ByfI03n1oGCAtxzdqMcXYTR
         UNwsae6l9D98fEI1oIgJXdVmGlBg7HonLJ74W3iCrcKDKBlSBpiIP0F++NTpWj7duq8+
         TCb80g4rFt67hwzu6H+5HTHJ2ZpC9fhhxlco4m4Mhga6C2dtfrv+i8uGJXFSeFc+XRa2
         TSlItcN6Ml1F+hL92Uk7XrlD52m3Ahp3lTE3KVIhfGvD3kuu7FlDTgSAuRWM+rYxFvUP
         g5fSqtnX8AkYBJ3HXUi/cMrqqLqCJk1z7ICKOfKwjd6hZuxOKN+73HtgNy5KPXVQq0u8
         f3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777875917; x=1778480717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kr3jwdRxaBtI40R+rmJsDENRbmnOH5f7Z3o6bDWB034=;
        b=C6bjr6ykK1PAr3gg0SXy1yEXABsK71bhzBd/LePHPKLKrd+vzJqv9raMfKyAusPNgh
         zqYnTHUs5T1SjTPBPTNKGIOQ9RQkKnk4gQydtQOjNLo09ZIWSMXQg6XY1Zpa3Xjovi8R
         B+S9+B3qwRkDNSXDntgzp/UMBCaiUA2LerxPiZGEgkNh3N2FXsndtOpA/wXKx1p5uDoy
         6tTpe6HfqRhEhmYCbjvN8NlzjUw+Z027aIxn99W4LwdC6TKDntJEgem491XozeIxh5Xf
         nxtnyxrOlmbVGI1Zdco5WZDStKeWc5L/hYlTQqm6lAEnjUW/lmqxhprIgRnKRO+c0glX
         Nsxg==
X-Forwarded-Encrypted: i=1; AFNElJ/kxWqju4+L1S3AC9QPr/yAjMLscQn0XowFiW4Tn4Z9XnQ2nYq3mELsURLN4tmivrv7pXlBalvdPku8@vger.kernel.org
X-Gm-Message-State: AOJu0YyyhbwpRpXVYS1JKVZtYd++eeXirF43+KaAWDJ4jpRT0+2lUG8e
	JbxwOfjCmAhgFZ5+CFPCZHqGFpCTLpJSZQoyqpsaXMxMdJnMnI8JDC37DIJ6NLEplMt8vmSG1zL
	UQsrYfkyoZbjifrNmCfk/mVvxqW4SCC6Vv3w2d6NVQCWVGON1gGJiHWWKYWNnqCQoY9gIB0ou7O
	rRmFnYUlQ2AOcQL7Vn/pOVIWLTTtB6F9i+9Wgo+zU=
X-Gm-Gg: AeBDieulICYrsZaB49VeCOJ/vIs2W42+PodmlWIr1SDj4/pUBAKB2h7dc22Zi8mBr1D
	ajyFlHd1FzfL1EgTFigtA9gSRKPTMRZHLF+l6B4tVMfC+LIpFXY5kLoVFWcgMXbJMbWPN5EQ0af
	Lp6g+AHMK9p0M+k0idxVsqgr8L3T7BIlX7Fh9IJP6HTh99pEorPYEJOyHgXpQs1g1uA4agTSXlM
	aJ1fwxy0NEjmbX43Q==
X-Received: by 2002:a05:620a:454c:b0:8ef:74c9:daa7 with SMTP id af79cd13be357-8fd155f1d33mr1366862585a.8.1777875917239;
        Sun, 03 May 2026 23:25:17 -0700 (PDT)
X-Received: by 2002:a05:620a:454c:b0:8ef:74c9:daa7 with SMTP id
 af79cd13be357-8fd155f1d33mr1366860085a.8.1777875916771; Sun, 03 May 2026
 23:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430140118.3684018-1-swati.agarwal@oss.qualcomm.com> <20260503-shaggy-coral-iguana-cbf5fb@quoll>
In-Reply-To: <20260503-shaggy-coral-iguana-cbf5fb@quoll>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Mon, 4 May 2026 11:55:05 +0530
X-Gm-Features: AVHnY4LpYiNbxpk5kZWilKYhclSEgxdDqag9deB4xLXJKeWUWfhJh5yHp4_H1X4
Message-ID: <CAHz4bYsA+KcwYx0J1dG9_PcXPWKRCRPXjOq16tBo1PayexbftA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: qcom: move gpio-hog schema to tlmm-common
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=H6rrBeYi c=1 sm=1 tr=0 ts=69f83bcd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ZRzTmORx99hk5lNcyW4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA2NiBTYWx0ZWRfX9mRCfuiJCv7C
 DtBsDOb10R84K2dhjpFVezoLdW9LFf6iKk135/0NK+us5moYqy4iXBtvPRWmkpXrhJVfzVt2upU
 Vqw4j61hWrSVH1GrKeJrQ97SYlnbh/gW4pbugyLT8y4lGPa8lwKB7dxtwUYpt9K9p/V7XSzrhxa
 m5PUltqhRNwhfqlpzS6/LksZnJb11QDcpPndrLbiGwpnloqHbwijAHMS41KDnVyci+fifbUZgy7
 cxw0aVnqOsSRZItp4zj0PlAtTH6J2xSxMmvr15m7Fw2XIn3opYbrM7P2u5fEXCZp8V6DcKeGRAT
 gtjDJlamhcOz41p3TSAvGYEWrGvwePA8hrkyaCYy2xxrDj7Ino+aH4lLd2pq4p/4hu89LeK0xqa
 l6VUPFxBAjv4qU6tH8beLe52vUrERXxgetfM6g5oPVWVkRYiSjYTl5nhyqSRMjNOEQZjfF8kk/Z
 PcaGuCD3XkNho9QaUCg==
X-Proofpoint-GUID: mFjv13mAbnr56KHqzo7JRmnYGoD1dPKA
X-Proofpoint-ORIG-GUID: mFjv13mAbnr56KHqzo7JRmnYGoD1dPKA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040066

On Sun, May 3, 2026 at 6:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Apr 30, 2026 at 07:31:18PM +0530, Swati Agarwal wrote:
> > Qualcomm TLMM-based pin controllers share the same gpio-hog binding
> > semantics across multiple SoCs. The gpio-hog pattern currently defined =
in
> > qcom,sdm845-pinctrl.yaml is not specific to SDM845 and applies to all T=
LMM
> > controllers.
> >
> > Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml=
 so
> > that it can be reused by other Qualcomm TLMM pinctrl bindings and avoid
> > duplication.
> >
> > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml
> >
> > Link to v1:
> > https://lore.kernel.org/all/20260417152014.3000797-1-swati.agarwal@oss.=
qualcomm.com/
>
> Does not look like v1. That's a DTS patch.
Hi Krzysztof,

Yes that's correct, v1 is a patch to DTS.
But in v1 , I received comment from Dmitry to move gpio hog bindings
to qcom,tlmm-common.yaml [1] so just gave reference to that v1 version
and splitted DT bindings and DTS patch patch[2].
[1] https://lore.kernel.org/all/6ijpvrd7mm5c6zsvogzm6uwsxpwqugur7oles5i55cq=
yage2hd@rig24poqt27g/
[2] https://lore.kernel.org/all/20260430142000.3707614-1-swati.agarwal@oss.=
qualcomm.com/

Regards,
Swati
