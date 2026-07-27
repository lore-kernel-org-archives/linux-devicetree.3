Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF247318ECD
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161295; cv=none; b=HpTp+xfwYi8KRXy3EVxMyEf13nL0APYOGG5tR5ayKg5S7E/6QFs8pM1hKZwevYvgfAMZzPAFUJnc0KajTJE3AjppL5W8N2I2SNJ2wxxaUbosl8gBh8re0O28YDJGnGh9h2allEfPPaNbidkCQXQgOvgJa6ltrmOldpa2X7C8G+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161295; c=relaxed/simple;
	bh=X26uLAsLDlZ0iLHWCeoHqJ1BpK501srndGa4P6m95oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YwwCgEZky2HQpOxiAncoBwv8IQnD5DSahGKxJ0rM3QJ/gJ5tCTJdu7553GCdvv7TimOj13fiMiOmilMM5Srw9cBNwbb3EZ1v6WfjawoCY+3Q0kYrEAS0D0kI4C/u1qLI9j/vj811ijKdgjsHQ4HCzgprU7vJ70O4z5M/OVrzj5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqFB14XV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D5woMwJ7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqFB14XV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D5woMwJ7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlm1Q4035385
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ziM/+DZgXdtc8jAKvQe7Pv3QHaJFJ4hODKr5LhR/F5A=; b=LqFB14XVzXSoXJPV
	6fg/i3jo8UBicp8ao3JGET8O+KlzNHzMjlNNToqidG/fivAVXuS6KSvhECin3Z6p
	vRmg6vj2Xsp4JYelDqk+aorwSq18IfRJWeTZlkhYwERMoycfj1ONwsacjRW6zuF4
	fmIqDiHGm48ZcumBti+gzQoFpzy3XZuFxxCP7CJ3CObAoMJIcFKa205+1NauipU5
	fBZLNUNJzYamMgjDzsdj99zFlJBpIKFS46+gllitnQhQc2k+QpxELQtgyVGr4qgw
	JlLOegwK/B4EPmDf8xMqktmOiTLWxl+a3/1JVoz31N0rwgVJTvADG+AWOCFIu+rS
	pzDoeg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp30g1jsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:08:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5e21552dso7650985a.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785161285; x=1785766085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ziM/+DZgXdtc8jAKvQe7Pv3QHaJFJ4hODKr5LhR/F5A=;
        b=D5woMwJ7/xNt0v3TQfzwYVDc41JSegGmdn71rsGIbKIz+tIN78nTgAggbxGbAiIcft
         JAMNeRXjQlLJGWdTJKFodXHWJsqQ0iFk6owMgUedtKr4J3NlCHGJSgj7wbVdVg7ktzsY
         HXR7vZU/FCfMrCvq84Iu2WpEjHn2uEQ0/Ds/Uj6ABRKpNGZydesCiooS/AR/ZLzpHaif
         mLl62HpF2ITjU/XNOFwOzogh5TW+JOqWnbxHMTqYoQLzv707pnyUloCp/merVtV4dNmq
         +AAbZoR4nLAoJoeYJIF3Zurcsn+sQdT8/ackGU73Sr48KhoqUdwDdYRvdVAKEDIDCTz5
         HDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785161285; x=1785766085;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ziM/+DZgXdtc8jAKvQe7Pv3QHaJFJ4hODKr5LhR/F5A=;
        b=sppzMyQCPBP//RlXtYosIbc9cj6jNCE8O4lilc0YmCS68WTbpesFSqLBFz0y/ShvS+
         mKV6ua9Zjm9X4BBvav4GjH8UvtfPZYZyziJDvZXCGrDths5sY3EL/xFA/WzZO1ZniwL4
         5zgVB7KX1ujlwt0vjQZdzUz31uDeHJ7YStMbw8N8eBt/yUzdiTgkkg6xG5uM1AiOl+vR
         1QJ5iYRmDHCl8+zXxHcjgAAy0Q/lV6+0nVUBqH5j6anYHnCezuoNMrGW92sx8sQR0qJr
         ++GDMpuo6SDCWwW64XHt6b4FoRkOydz80/yNTFU9gKPMhWNGRZWV2z9lsNAii8QNkZTV
         pwGg==
X-Forwarded-Encrypted: i=1; AHgh+RpflMH8cvzd1fPRTcNSAkE9gIcRXXmfAaVw38GVAA5mOnpN3rWFMRC5SMpSZkr6D6rMvJ6iNLbLS3vw@vger.kernel.org
X-Gm-Message-State: AOJu0YwhiK0178j//lriV/1HYIC9ulq+jFxD8IHqu7F2BofWeg0qs+wp
	00nCs4PDNWg9bNy3tLM509ntVf0/6UWwKj37cwNrZb2HpmKjzsRBbibSSK+2rTI5pZcS+73Ac+k
	vkpadcBT3s8bjDw5d9E21bMuGPbj9nWYJabQeMqiCQUE0dY37nP21QLwyom7dm3wg
X-Gm-Gg: AR+sD10mwTLvABvszTngKu6LPHUot6zhi+m27TdIHS7o8m9TAcq1qyvPqU1rmdXTFmU
	d8T144MZuO/IQY7DdA8s7enfsAs1Zbv4iGlAoYoZ+JcnMfFACM+El93UIRNWB8i2oCpesd+DY4r
	DVxYRdAzcnJXycEf8I8EAn2rQgqt3MxK8HLZEedcY6HWE+Jyztnp/pI9tkE8Q/HJ3qu1HzywAqN
	xZkq/39x7ypGXItH6CyGHsE2kYVR6ETJ/dIbOX8K7ccBFeFqGLXzjI9x3wMVeQKgWFhKSOBnbHW
	/BXyvG/FfB2MFnS0/hcWue8nMqCGIoF3SMWidVSUJGFd663uZEHkvdtnJDIFpS0H++RMFGdDocz
	9FlRsKoP3GbeBPcTkeW/QaWWZ
X-Received: by 2002:a05:620a:ab08:b0:92a:d10e:bde3 with SMTP id af79cd13be357-932fc00dd43mr26437185a.3.1785161285391;
        Mon, 27 Jul 2026 07:08:05 -0700 (PDT)
X-Received: by 2002:a05:620a:ab08:b0:92a:d10e:bde3 with SMTP id af79cd13be357-932fc00dd43mr26431285a.3.1785161284738;
        Mon, 27 Jul 2026 07:08:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebb385sm651388466b.52.2026.07.27.07.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:08:03 -0700 (PDT)
Message-ID: <4d0c2aaf-f521-4527-9e53-3c63f6930667@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:08:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] arm64: dts: qcom: mahua: Replace pcie3a/pcie3_phy
 with dedicated pcie3b_phy
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
 <20260724-glymur_linkmode_0724-v7-5-65c8469c6b65@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-glymur_linkmode_0724-v7-5-65c8469c6b65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a676645 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=GN4xtFq8P7hki0q-dAwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNCBTYWx0ZWRfXxdnB97yKE92O
 HN+k0XSc12bDAtjY/3xYkHTqrmOO/XmjwggPhhvO07MpHXHZT24XnhqPtuh9F4g+Q5JTJeGWJ6X
 n6F7aXLLgFWoitF3p1SgMS6L1RhdlhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNCBTYWx0ZWRfX20DpgcSrOxNg
 Wv5rCsR8/cl7GLfZrnUw59WDV9jENpfMkJ15veTvSU85zAPDOUHX05EeMrJwuAnWhKayD3JHsmZ
 zNd3Z/uCj85BCiW2n7j2E8KgK63NBvYoyxM2OgACyalrgWN9uAWKoKTtTWFJ5waiuxFHz1xJ1gb
 Pkf7DqOLTlnDFL1GKFHu2gqwKcIcXG4RAoTEaMcxChBfJ36v7+CO93noiUHeVfQ5RpiwD1Rixio
 V9SaXRCNXo31gI525HMz2K0XhIrBfH0zIJNKumgnYHfyyAst0vTFUzDXJELrIh3nx3jxC8S4Bby
 8X4ne/Q72dlqK3FaenIOwE+vwDdsH4RzyBF/SXfw+c2olMgmCjGLTfhBWeJcERynPvsvCvNV4J1
 bWsiIoefuMlT2BE2faJ1IOwG8/F++lzjeYSRCQtEJc6peAZ1tpTeZ0SVdve1pe9fMpDGRtR2th+
 WW7XWzgj8jY9a2m7X6w==
X-Proofpoint-GUID: sg5Gq812wWdrp7hyF41_WO-JpPRHmZHt
X-Proofpoint-ORIG-GUID: sg5Gq812wWdrp7hyF41_WO-JpPRHmZHt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270134

On 7/24/26 12:01 PM, Qiang Yu wrote:
> Unlike Glymur, Mahua only has PCIe3b wired up; there is no PCIe3a
> controller and no shared Gen5x8 PHY block. Delete the inherited pcie3a
> and pcie3_phy nodes, and add a dedicated pcie3b_phy using the existing
> qcom,glymur-qmp-gen5x4-pcie-phy compatible.
> 
> Point pcie3b_port0's phys and the GCC pipe clock parent array at
> &pcie3b_phy instead of the deleted &pcie3_phy.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
