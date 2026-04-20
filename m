Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1B639C007
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 18:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776708408; cv=none; b=K8Enlyh6tK3D0dI9byq/lxYCjsXsrMi+muJZz/rxevb0zsLJfpQ+op2yemOBwVljAanPIswqybXg2wHoJo/RI53T2cuEJEE03E7jwhdRGeU4PA42it+3cfaI4OSnfyWI8gjHty720A4Q89VUYI6vJQpz2HUSfwsbAzloU4qQ8kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776708408; c=relaxed/simple;
	bh=P3k9L55Py5iygvbuz8v3BUNDQyDoCpC1j0/SakfBang=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eEPFvXEn1Voy+8+DHBJp1Y4JQqoqjfdkvAnEwqDBiwKnP2v44OvQjSlAEGdbHRHVND5J8JEXlWlH+p1BH3loiydJjWW7vEc1O7Y/amRt1mxzggjfZ+RWPri8m0ZdebMGW9SZthYsAxZlgsvPkhdbi3YYn/cbSmlgDGXLkKSi7Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iY43PVgB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WoI2PvyQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iY43PVgB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WoI2PvyQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KHtUfi1598147
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 18:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zonheXzxU0hhws98GBDdt8TkQYvmh29b/wxcvJo3jyQ=; b=iY43PVgBJFunTknH
	dRioGMay3SYP5yDeqpfCkwaDcX4QUvXvvvh7SJzHxkF26measeSRV70TBsMHkzcA
	Y6ULtdZAAJYEDTzpgIXNGMk63bwUv/7e3nTuqfs6AUSrL4nj8UebBuqsj4i7B/DX
	DBOPH8H0Sn10txf5tAAWZawnOCbgdJiykQjpQ77izPg/GkIhHY2IRXGvPr2jtIY4
	kFoPWCsLySmygRWN0i/AFusxkVFJIv6nFQp7HncfkdFGHCIMg/+A51xC3BTqnemg
	uDgeS9CbmNPpW4/OtUF/CKtePN96O7TZJrx1s8jWk+Dzq5FryjiYvsM75dwYnkMx
	ijydag==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgnjqc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 18:06:46 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-69491bd267fso982084eaf.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 11:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776708405; x=1777313205; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zonheXzxU0hhws98GBDdt8TkQYvmh29b/wxcvJo3jyQ=;
        b=WoI2PvyQwu4K0O2RLsvwj8vdKd/6twj7b8UeLC0X+UX1fogYg5O1I+vOKZpER+x5xG
         jBv3mx/0TEL4abgcHAAkiUXoAcbSnpiHMqRb9CjHa9FD0dsHc0kAaEAwa6fWsDWknIch
         yUQbUWq5XNJLq7GtVzJIQlyAYAgBnTEFDsdD/hzfykVrPyyaBpTtIhfE0tnvF9kzqoco
         Iq90BqwuQCaG+eCW/CyKgRhbDlUdpnVN4NM76erTSGMg6nVVNLGNMndljUcZUX1lNthI
         eIgjLjwMaFdylNQ2t0J23lb/v3HEH0eiM463KMrB/sXrp9mnvEZYBsKbeGtvC9yvExI4
         HEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776708405; x=1777313205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zonheXzxU0hhws98GBDdt8TkQYvmh29b/wxcvJo3jyQ=;
        b=smZxpEjuQEseGc4ySS/Zj4INvlj5Nrcwf+6jWnKYm2DQhyz56/zDFV7m7qCJNpzN6C
         KVSPAENJtgGaByKsSYCHDpia6WAcTmB+j6+X/TWIVKZ/eDuIn6wOdN3PN28ucsEPdpQK
         fTs/cR3onxnC9NYon3S5mTS9Z8DnlntBy61KfK+fxP2rpPYmguUIpUMowaELQeHBnn9i
         hVqpONkQMqoVbzLvif5AZ//Fyh7aWLJhKU9dh5sz0yVHlwmkRD7rjgqzC8Rv9tnwbnPu
         mBkmZZmyZAOa5KF7kgptQ8tItM26FmaSplE2AHP9qXk+Q0zpdUb/tcfB4nHBpkrDfR2l
         VSSg==
X-Forwarded-Encrypted: i=1; AFNElJ8MUB6QeXHGaKaDB47SK1SxZOcWK+0Ql5f0vm3DBuOKKOz6eSwpYNG1QKKw0RI2mOR4C+JBShlDZcGT@vger.kernel.org
X-Gm-Message-State: AOJu0YzXXBaLIuUjpwR/VG/RYKgPAYwdhj80kZLHAM2/zxzh28WONIR1
	kEX8HUefy6QyYZmh7hLBbswKX2H8FPbt9ifxsFwZwwenkOvzexSa6y3hshjzafuu++kKrh4sPEv
	taFPVgGq2rya96UjrN/yICdzbbvCGquOdJP6dPt2lHVW0z703pixDoY/4A/ctyFfF
X-Gm-Gg: AeBDieuaEdNze/ug3bXHOSClqjImEjhnQ66RYK/zRoZgIv8nXDZb0aH9nYx3QNPBbT2
	QZO3smR1aazAnsi3Rtb/TXijRl2dv/s6l97odJptypH9h4MqfxskUWrSWpb/DKu08NQl2fAH6U5
	nJMLhW24SGgjJJxl3HeBrud+PEidYyMVN//v4Q8827n94VRP85vpK7AhQiereVAgQnp9N1NKrna
	xNgwTbNciyM5RVwL2I1lMquz+mu0qatSrVKz2mzNwp0eRksva77NfHdoHG5VnSa+lyS6FwHPXrC
	mQZa6k1Jjx4Bye2HWOFJgJBB1SMCB20j76hvNlSIRSGddpkKytX97+L3EchCQso8EhTCELVb1BO
	R2SD5pyiDLiAavafhhmkZeABhI598Maaj4qhi1NAszVWFxQmvN57BjQbsRXKOFZLDd6e5Aj3bla
	ZV83Q5lKyqbHe36ek1ceg=
X-Received: by 2002:a05:6820:1789:b0:689:ceb5:6f37 with SMTP id 006d021491bc7-69462dfd581mr8460524eaf.6.1776708405435;
        Mon, 20 Apr 2026 11:06:45 -0700 (PDT)
X-Received: by 2002:a05:6820:1789:b0:689:ceb5:6f37 with SMTP id 006d021491bc7-69462dfd581mr8460489eaf.6.1776708405005;
        Mon, 20 Apr 2026 11:06:45 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d5b1sm34430299f8f.30.2026.04.20.11.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 11:06:44 -0700 (PDT)
Message-ID: <67d47859-6481-40ab-b2c6-6d2eaa000ba5@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 20:06:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: thermal: idle: Complete the example code
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>, devicetree@vger.kernel.org,
        Lukasz Luba <lukasz.luba@arm.com>, Zhang Rui <rui.zhang@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
References: <20260407053957.10508-2-krzysztof.kozlowski@oss.qualcomm.com>
 <177559016610.3536304.190890909066170434.robh@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <177559016610.3536304.190890909066170434.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EySa8IpEG6IWgXJOovj1IitmUxrpLwBa
X-Proofpoint-GUID: EySa8IpEG6IWgXJOovj1IitmUxrpLwBa
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e66b36 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JABXMR6n892UP4o26GUA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE3NSBTYWx0ZWRfX2H8odKIpHEoA
 +lsOyN8ptXSXH170I1uioRzW7hqB6eXx1V+RJUPZwmZJAqhlzTwu9CuAZRRK/XPLF/Rl62lzmlE
 uCFkPcPU6S+oE19cOuzlxV8EUzPe95ajNJM5sEhlnV7ntCbnzRHfRnYNnnHn85xq40Fz443oDlg
 /GjwixozvFGLJOkof4WyJBUkbXWnsYFieDkVOepvCXRMMlMvZKx2Z+cZ5wgd//ufBfL5aEXiaMe
 5bUaGzRbTK1eP5FV9lEsfE/qDLcM5CfnOIG33AZ18QN6quwCqbLK9uPIFujx5qSG019FzPKfNCG
 YLawGxKTkSPe9aH9+gwp4XZlijcMayHFNDEccklCqdqSvH/K0e6HEbSXxLKNEWnB7O4TI4MpjzP
 6k0nFY6cZvviqiCTQOh0SMgLfQmSHQU8VKnUG65NEloBYviF/MvtjzpNl4dzSI5n4rDccRcU0u+
 IpA9KCsm4QCaF3ZAZVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200175

On 4/7/26 21:29, Rob Herring (Arm) wrote:
> 
> On Tue, 07 Apr 2026 07:39:58 +0200, Krzysztof Kozlowski wrote:
>> Thermal bindings expect the node name with all the zones to be named
>> 'thermal-zones' (hyphen instead of underscore) and thermal zones to end
>> with '-thermal'.  Also DTS coding style is not to use underscores for
>> node names.  After using correct names, bindings point warnings for
>> missing properties, so add also thermal-sensors.  Drop fake top
>> compatible as it is not useful in this context.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> Changes in v2:
>> 1. Drop top level compatible and other properties
>> 2. Add thermal-sensors
>> 3. Rename also trips and cpu-thermal
>> ---
>>   .../bindings/thermal/thermal-idle.yaml         | 18 +++++++-----------
>>   1 file changed, 7 insertions(+), 11 deletions(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:

Hi Krzysztof,

what about this error ?


> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-idle.example.dtb: /: 'compatible' is a required property
> 	from schema $id: http://devicetree.org/schemas/root-node.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-idle.example.dtb: /: 'model' is a required property
> 	from schema $id: http://devicetree.org/schemas/root-node.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-idle.example.dtb: /: '#address-cells' is a required property
> 	from schema $id: http://devicetree.org/schemas/root-node.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-idle.example.dtb: /: '#size-cells' is a required property
> 	from schema $id: http://devicetree.org/schemas/root-node.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260407053957.10508-2-krzysztof.kozlowski@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

