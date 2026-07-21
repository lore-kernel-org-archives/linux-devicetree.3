Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D22539184E
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615189; cv=none; b=bP/pbkqNtTFtQtOrlBLtyV252qhO8wTBrz6fAbFgt4u55Jal1ubNykNUUT0cpBteNkTy2IIl0cWyBtQ69OXrIqKGAEHI4WpqJLlIh3Akg/JBKhsfOf0g0e0T1DBHV6EdDkNeaSirq+cPHcLp2nbVkN+uOM2XBcmbNQ4tF2Hcmco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615189; c=relaxed/simple;
	bh=VqOYnXryX5hse7vNX7beg9gB6ZmLI98ukA7NaZMtYoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KwOjX/UL4QqmmYsQNDM3Cl2UuzFWyiS3/G+ApARM2hcqEhTdtve4aV2aXQolhiACFTfsolzlyrGBXjUY4V1hSo3GRucWR806TY7zOT08Bp/1uo4TJguPczk59s+QlYfGcVJOy8UpyEyIYWo5Ytivjmr1SnSkDnuelG+GAA8foAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDg8fXJ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YXXainLk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDg8fXJ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YXXainLk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNDDYP4150322
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X7YOLWh2XFVEuyXGe31/Vt/m
	4Y+5JxiAP6LigbuEd1c=; b=hDg8fXJ70p6bMtZwVbGHEfKWZujp9rRe+yBH1JwH
	P0yLWwPE0komCZNjRXCGLLpeLdt874gpYsx5wdu/l/nOjnSZq9KWSg5hZvFWsqix
	QUiS5PccxCB/Zily/Jj/KHI/Rc5WWRgO9f+3HYBUyShLirSkZxsqbECnpMiwl8Ru
	ss8URcuL0CG3VnKDOvp27n5ru1toWat3X4tpLR90cNiYsds4yzUaVsX2ed9mLdU2
	9IKg2CNbtBe7Wfcu0IxDU4RKehir2Cb6bF+QC/cGQiSFIR8e/BUTZEIYozE4Qbi7
	cGZy3mVwDBMDRsJaES4P6xfVCQ48S8CGvNHX1nhw9HW/Fw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqff2vgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:26:27 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so16688185a12.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 23:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784615186; x=1785219986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X7YOLWh2XFVEuyXGe31/Vt/m4Y+5JxiAP6LigbuEd1c=;
        b=YXXainLkQj35xeCPIsSJ10yWDS12vteeaA1H0roOk1Q8t4HZnf2xe0LPnZJIFGrPeQ
         5Si4jdsuOk+l5s2/8WSUHnGSfPXMYlbkPi5wkFc9rf9MOREvzt+aAEnYGxGOCI3hosiz
         PuiwvZPM/Fcz5lB/12D7eh5Epqtl9C2swB/43p/Syu+FUp3Iyuqze+HOW17iXMrYzpdO
         B8ySQV2wsLPBCyBsvIy4Reb7UfESTV7Cx29O12KGeCCfrLbumo7P83Qw0JQweqzpiXDg
         sx4qqSOWQGburRBuwhotXcm0fI2S/dE7sqXhVEmRLqagEi2x6uqfjatIt4vMZgyh/no8
         DIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784615186; x=1785219986;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7YOLWh2XFVEuyXGe31/Vt/m4Y+5JxiAP6LigbuEd1c=;
        b=s47hw1AzXcr1oAItwot8wB+B/v2TeN66KHYfBYOr8EhYgPWL7K39frJghS4XU5PXi/
         NCjtk0wVmIdLZ0FsvRW6vdkIVjIAkxK6hlCH5u7eSwwqcveQaGltOZ/n91fL/0u8YD+W
         pUwAKv8EJ47vBQFvHc9/gsH1xCaVmX4FxfKCbesxZ1/lkqO/wiBqzy75s40qpQ0UWAcH
         Odm6imwa4ztBDsL2MvCeepkaw6q6+bP5OfUNKPlF3l1QHXlFijZLEKihFlf50/1Eclg5
         IwldeG9z1eyWDYzPMX/Y1mnCWbroIR8n7vGhmhhgqu5fInrGpLqr9FjPRrF9Toee+pGy
         DSvA==
X-Forwarded-Encrypted: i=1; AHgh+RqW+9T1hDzfSVta/hLkLODPCbMsUIozPuPDCwLEMmDCZb3vCmq8LF2GXJrcIRAGipeYwM/UOBw2WsPV@vger.kernel.org
X-Gm-Message-State: AOJu0YyoB0DFich1419o8eGaw3aooGLhZpgfFtRRin1e5PDF6PUs3KkC
	voHVYT5ZBCLWNpdj52lAzTL1Q65L7QiEnav6j/ecFUXZqfEfLbxRwLqt18EDd5uSO0HZFLWmUNd
	1B0d/RJYteYR8XsBIJ1h9YkYfy8eLzYDs0IqGxEA51oUDkVMTjqDk4ecyJdRPeRkhT2eaN/yP
X-Gm-Gg: AR+sD12ZRnd4qbyMC86hu9XemHtueCZFPWmoLBl7IfZ/PKaiFO1WFrAeElhAEZaMCCd
	dWoEQc6rBG8YjK5lMtg8S18XCQtslHcf0scZRbT4l92QJcryZzVeJ1U8fPDFhSYbCQvUwwhFnDF
	CDP8l8DRez2t29FBtcQdtP5dLmWGF7c8jea3kVcuOx79tVpBOorgV372cwnlZDuI3hpQ6cwvTzM
	PKQ1hJO6o+DoDUn9HIHa9Sx4Vw+l78vknQJtsptVNU/Gqp0Kk6/v2WYunsvLI7pa2jxkp5U5Utc
	BHlQnsano/zswp8w3MEX/VbfY/PHeRST36wRmF3g+0mt88u5idvkfZLOQgDnFf9Fg4KfmmQyZT4
	VjSTeBbiLCDtwuSsouFeIzEJ90Rg4wePda+DFuQ7/IKk=
X-Received: by 2002:a17:90b:2c84:b0:381:3b5d:30f4 with SMTP id 98e67ed59e1d1-38e4b422c19mr17561155a91.1.1784615186211;
        Mon, 20 Jul 2026 23:26:26 -0700 (PDT)
X-Received: by 2002:a17:90b:2c84:b0:381:3b5d:30f4 with SMTP id 98e67ed59e1d1-38e4b422c19mr17561132a91.1.1784615185747;
        Mon, 20 Jul 2026 23:26:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e92064f6dsm941493a91.2.2026.07.20.23.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:26:25 -0700 (PDT)
Date: Tue, 21 Jul 2026 14:26:19 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/6] arm64: dts: qcom: Add device tree for Nord SoC
 series
Message-ID: <al8RCwHGlk20KhPS@QCOM-aGQu4IUr3Y>
References: <20260721044005.2882803-1-shengchao.guo@oss.qualcomm.com>
 <20260721044005.2882803-2-shengchao.guo@oss.qualcomm.com>
 <26bedd34-6a5b-4b3c-b737-4f71b5b80cd2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26bedd34-6a5b-4b3c-b737-4f71b5b80cd2@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2NSBTYWx0ZWRfXx9rzjTOczyxW
 LG4f4hcCZA1icwAztIiFbQA8FnjmUqGl4XztemGHol51hcdGj4bTeXG9ZWWsTM7jFzOXnZitDyo
 6ocrv+rfbPrm7p6Sn+rZzi+4Advy5cY=
X-Proofpoint-GUID: r40m-OwYAxVAsboxOGzy_F5s4AlZ7nUD
X-Authority-Analysis: v=2.4 cv=FJErAeos c=1 sm=1 tr=0 ts=6a5f1113 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Img1AEHPfAqj_0BS3eYA:9 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2NSBTYWx0ZWRfX42z4RvTkCUK8
 yDEERYlGWMBGAFJQPr+vFEiK6XwVb2qWfgrrrE62WjlnMswN5Tq2KvPAxPwHOeJ5gBX4wJCcPP3
 s2fleuSaUguhrLpM0nqP34E14oH1ceeOIB0/9pPwpjW1tMAC6+OvvSOgJvKcykN4tMGX3R1Q4Y8
 0/Y1Zpjes75f/UcRz/4HOE/YqjvbW+VJsNglHsc/mmr7Fegw5qOjFRPWdaSXTDnKrQ7ZpWAl7Kc
 yDDMf2NHDlEFyc2Lha5SVP1F1nwgg2Q5iOT1ggAQKKjFCXmNGUDF+4fk3pecRcSS/9ael+NtcxG
 qoriBMlb+tEeEeJba7GLac7i6B9lgYwkoj1Neh3oxhKZD/3mnl3A7oMATxgrbEAFr4fTmU/JU0F
 ktKnH3uV0KfI35IUPVY77i9pnUH2JHFKiwjZDkkN6HY0TghL+Y1zIbSy1+44sa437rS0v/i2YlZ
 efhNUfy7q++rvt/p7Jg==
X-Proofpoint-ORIG-GUID: r40m-OwYAxVAsboxOGzy_F5s4AlZ7nUD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210065

On Tue, Jul 21, 2026 at 10:33:24AM +0530, Kuldeep Singh wrote:
> On 21-07-2026 10:10, Shawn Guo wrote:
> > +		crypto: crypto@1dfa000 {
> > +			compatible = "qcom,nord-qce", "qcom,sm8150-qce", "qcom,qce";
> > +			reg = <0x0 0x01dfa000 0x0 0x6000>;
> > +			dmas = <&cryptobam 4>, <&cryptobam 5>;
> > +			dma-names = "rx", "tx";
> > +			iommus = <&apps_smmu_0 0x1689 0>;
> > +
> > +			/* It stops nord-gearvm variant from booting to console */
> What's issue you are observing Shawn?

The kernel simply hangs at late stage of kernel boot.

> Usually we GPCE is enabled default if soc has IP but seems nord is doing
> differently here.

Be noted, the nord-embedded works fine with QCE. It's an issue seen with
nord-gearvm only.

Shawn
