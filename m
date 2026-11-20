Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170431;
	b=3xWON8Wqs9YNHsB2/0u44dNFiP/i8MAfqfX8U70GgBKX7Eg0Y1fEnD3a8Nm2pT39054K
	 4jB1WkeOu/bVsYGI0wW38UpuWkJeXc4jPYDKbXv+RjermKgVcbW8VZa5vFp5m7ITt+Gue
	 rbtfSfEKjriR/ofFo9ge6C4AB33wmba2gjZ0BYUX8MoaeosLvUNp6i3DmeYpIAeYkAa84
	 09RkwhOiB/vLV/KLr61WKY9elcVZ43b9uPuCcx9qN51KaxllGHg3Y40N/eeq7dl599NIH
	 DMbKmfMjng3Rc5WAa1yf5AfZJc0l9Ms1JiWy+081wCYhutkDxLxFNIxyd9W32PH0CGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170431;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TDi4z+Ry6J5IfKVSHZnQfjVSJF3Eiv71kFCtVQwFZH8=;
	b=nwiyhY+hvCAjGjYVx98OvYzI0anf84COaiTSL4OFamvv/06+f7BN6xCR17UX+JVZ57kZ
	 EMWxGMZpU2QvfhogGAYdK57hnhZSki6gcStA9WZGzi6Rseh3ylRlwUSzeGlSUDlvd9sWD
	 HOAZ8OoSCEfFPQCh/7IGfVemzf6OgSBQ7vgty3WAuRlpIHlNbPIL2GtT6HxP5cz7gaxwu
	 9/+52iQsefu15q6XJUXQW4P/thQN86VjQLaL5ZooyVkNqtbJzqLTOAJcUjMgneBfS49pz
	 tyuQgrh3wfUwxSBkJ9D/B4X6y+BUk4JHCKthmygC2/wI6YxYdzv7dobaInNX+mD23Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="UCMsjjL/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b4NsjePq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6A560A260A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A6A560A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UCMsjjL/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b4NsjePq
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7etlQ3575535
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TDi4z+Ry6J5IfKVSHZnQfjVS
	JF3Eiv71kFCtVQwFZH8=; b=UCMsjjL/gYj1YrSdI3mPgoWUFkroEwEenVvkoLXV
	PD94DQq8IzopQvJZfDxnY0WgkkSJ802KdnU64vveupJkHK94Vza9+P9sJlnMq0zJ
	udeo4Qy322jsgEcxOr9jUP9zBHUU3vN2NN79Cx6C9KJkLFTAGoQtyeLNM4nRaM1+
	azSHW6pr5RYxLmsWaQZ4wEAtjXWxFV8i52y0KhGij+4bI3OE8bGyv7xQ+eyMNtK2
	8gVIKnh4y8um/clEGne0POIVBK47mW2eRvG1ER2xjjbE/X2eRNrZBCmM0iTd0AAY
	XGXjSNTZeLfL2VeXgd6+f8pVHNnk8E5nRDeOgF4L/l2l2A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu80y8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:27:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso912233eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170430; x=1795775230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TDi4z+Ry6J5IfKVSHZnQfjVSJF3Eiv71kFCtVQwFZH8=;
        b=b4NsjePqA8nFOVCsLyIf6NVtNyyBD1S9Iduf/zsHvj9VpxcK/yxRxeSbtrbF5tn6qu
         qXtQjt/e/DeeblQ2efRNwg0QY1+W6Aoel0N2eYiS21LB7Fk2hvnLc6apzp/kjsfJMUgb
         2hD2oaG987Y6kd/tHGpW02AT/zHGXUWzvrJJZesczBeJRvwGstmDpxpj3IKh4NPLyWSK
         dMVoJzbc5sDyLCu3BJVCU6tvnNuaTiAxOB0d3W+3oOzdPuPV0Z6rzeAvh+TckElfBcce
         JY1MKaIUrPnHCALqbX5bUzaf4dehpK4yAC0Jmapvz7Ts14IlCSSAaC1a/QG12b93sZkB
         xqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170430; x=1795775230;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TDi4z+Ry6J5IfKVSHZnQfjVSJF3Eiv71kFCtVQwFZH8=;
        b=EgzrUxueGruc1EtKGkn+drruR1b8ypDr+us619jK10gXNd9324VFvnZ6A/M7182tfe
         a08aVslOZ5Ad6kyt1b9eqntd3yQ/eaqVbBar84tUwIT9oKJiSX3nMOnANvgm5wi8ySZw
         oB4UpFaV5Jn+6jwa+He/1JjGqae/vJzRlKKBbfCBCo/P0Dy6ivl3b7BD0ryC+Gp4hG79
         jftVeH5XnyPSi5jv+alYtbZ6EDTgtTQRkLBk0XOwW+RSyJkdxN91GStDYF+Asan658/3
         xWJNbTkwLLpvpV/8/kge7WX/Km1z3uUzUQDIt57oJaJoVJS2ZWte2A9gxmjP5z5+lPVV
         zd0w==
X-Forwarded-Encrypted: i=1; AL+hErGCp/UBXnCkTiVprDZG2j+K3sHZHVE4jAQxug+08IGwGShdecLAmEav1iTelfBOkPP7lHAeGwXs8TUV@vger.kernel.org
X-Gm-Message-State: APuU4Z+0IYoSUdFApwr1hF+gaBimjz5CmGSDo4YBb9rUjUgIApXmcaZ1
	dTxr8copar+v1WGA/Fn03djMWg/tFK6Oqu2yg2PlE8zvuYmqxy9W/SPbIa1TNZtPVCGnGNNoCs0
	Z8L9eWbeIfvXPPlBg3HfJcuL7zPg5H+a5jmgMMVnUIYu1WF8itEnRzJdKScekwbpg
X-Gm-Gg: AZFdTZfGgeH1YgDJdHGsc5lDe0dGFAaO/kUxf1QXIo8OD0ZEjK29igOxv3zEtH0rIq1
	LMTXaRrBDsTo6rYxouw87pjt+OOPWom5TWfXOdeKvaziok8Wga5dWVJAjPOtwa6jshhWyRXmfho
	rY0F232eRNjz88H6PfXsXELeK0AZQMLZHbsb8YfAWUcWfl1BHueXnQpl8bMcUa8Xsm09PAt63DF
	/fWXKp3YhRndtqffTjAJTqEyahP00BcWrtLTl6VH6pCnjjT4HEICuwvWI1Y6fjzfR6WffifwNpa
	/OFGgu2CSBLXZ+g3PIzexTLNxoBojrx14D/u05eS3VfXIm5/Yxv/EP2vaM6oWM4UjajmZ012yy6
	E9CNPSj1yYxjbLfGYWldIr7NEd8m5pO9P5XOrI6J45/0/GICxc7U78lF5sbiN4KGSgBuCP9/AfV
	yr
X-Received: by 2002:a05:693c:600a:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-3863f13587fmr543224eec.4.1795170429457;
        Fri, 20 Nov 2026 02:27:09 -0800 (PST)
X-Received: by 2002:a05:693c:600a:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-3863f13587fmr543199eec.4.1795170428857;
        Fri, 20 Nov 2026 02:27:08 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm6982026eec.6.2026.11.20.02.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:27:08 -0800 (PST)
Date: Fri, 20 Nov 2026 15:56:59 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bibek.patro@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
Message-ID: <20261120102659.gaylk2rqi63vmq66@hu-mojha-hyd.qualcomm.com>
References: <20261117-rpm-memory-non-wc-v1-1-e246fc6bc66c@oss.qualcomm.com>
 <20261117161904.2hecbffviqjz2dub@hu-mojha-hyd.qualcomm.com>
 <6965d3c1-1823-469f-8777-17fc52e132df@oss.qualcomm.com>
 <20261118125534.7iyzuefhz4te35st@hu-mojha-hyd.qualcomm.com>
 <a116e2b0-8857-48c8-85f6-be3a62325515@oss.qualcomm.com>
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
In-Reply-To: <a116e2b0-8857-48c8-85f6-be3a62325515@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX4SgWM2n+JnlU
 sHX9CXH/+HggVQmxfUPAVfE7mUUDzTt+AfxtZzIyDW1YeZrYtCvWuKmovqlS46owQ56SyW/MecY
 zB8+VyJCRmcA8xeTxjkJOvlMolZF62pXd8NwO1Pc8+qcIXVQpTYc8lNboYfWSz92Ee+XsVUugF5
 dUbnSUoGOWXVcKgVDb52QMhJJQrHX1HJZ1Ia2xPdi7Xa5wVx/lGMHt2fuUVfnV47+R09bARQiDW
 xmp2pejkkjhod/9tDO01q34Syiq1hVJNJ3oW0/L6v3aF+TQ2O/YwJOiPpTf98KlpBVMloTyXsSX
 qoUvWK0kfWlQAV91if+Ij4+ktvyg0e3G7xbGMw2WN0ES/B2ypvELFejem+odhNflgfE9bcDSfLp
 XqPzI2mFS2zAqrzD+3WktBIbShEY5LORJpzZWn24WWIn7rN+U6l1A1HecH7yun5RoiKGc8LzR5H
 xHPnNn1b2XZtUbGZNfw==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b00207e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=a3soqENLMLS3xwJGqFMA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: Za7H5oLZlNFekhc2UiJWE_KaHImArlS6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfXyKQOtRMLROcY
 Mx/gOg572VxdzCp6VDzJW4OSWbq4F4I07ua9RCygUyFT8dGNgnjA5yyxFMsU8TcrVnC3mdIgJT8
 kMMl+n+sGADhhzMm8+Xb30hG8I3vXQQ=
X-Proofpoint-GUID: Za7H5oLZlNFekhc2UiJWE_KaHImArlS6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200041

On Fri, Nov 20, 2026 at 03:06:50PM +0530, Vishnu Santhosh wrote:
> 
> On 18-11-2026 06:25 pm, Mukesh Ojha wrote:
> > On Wed, Nov 18, 2026 at 04:35:55PM +0530, Vishnu Santhosh wrote:
> > > On 17-11-2026 09:49 pm, Mukesh Ojha wrote:
> > > > On Tue, Nov 17, 2026 at 01:35:50PM +0530, Vishnu Santhosh wrote:
> > > > > The RPM message RAM is shared with other subsystems, and parts of it
> > > > > are not accessible to the APSS. It is expected to be mapped as Device
> > > > > memory.
> > > > > 
> > > > > The "mmio-sram" compatible makes the SRAM driver map the region as
> > > > > write-combined (Normal Non-cacheable) memory instead, which allows
> > > > > speculative reads into the protected parts and results in XPU
> > > > > violations.
> > > > > 
> > > > > Add no-memory-wc so the region is mapped as Device memory.
> > > > > 
> > > > > Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
> > > > > Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> > > > Why only for Shikra ?
> > > This XPU violation was seen only on Shikra, and only with Linux
> > > running at EL2 (KVM). It is not seen on Shikra when Linux runs at
> > > EL1 under Gunyah. So, I kept the change to Shikra.
> > Thats not explained in this commit, why this issue not seen under
> > Gunyah ?
> 
> Under Gunyah, Linux runs at EL1 and Gunyah maps this region as Device
> memory at stage-2. The stricter stage-2 type applies, so the
> write-combined mapping from the SRAM driver has no effect.
> 
> With KVM, Linux runs at EL2 (VHE) and there is no stage-2, so the
> write-combined mapping takes effect and speculative reads reach the
> protected regions.
> 
> The region is expected to be mapped non-write-combined regardless of
> the exception level, so I kept the commit message to that. I can add
> the EL2 detail in v2 if you prefer.


Thank you! Please add this in the commit text. Also, I think this is
applicable to all such Qcom SoCs.

> 
> Vishnu
> 
> > 
> > 

-- 
-Mukesh Ojha
