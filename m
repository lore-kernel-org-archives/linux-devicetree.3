Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED34644AB9D
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 10:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456502; cv=none; b=slIxr1YNrW9REEfpl33ZlEe1a/E6df/7Cwwv/R52Ot4NDSHNiMP48fANs8sl0/kWfZPbOql0YFZWJO43enypJZ6VCPgA6BUG3ncw2Eet3lrQ4QpmP1yyd1S4oYT9aUWoYKu2JTjBD7R6l6wbfiwrJkZWYn9fXXSRbp/FWre8V3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456502; c=relaxed/simple;
	bh=MRWYbGRMA3UVleoP7G/ToJ1bM42+0FfIhPOGUDo5LYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pbha35EZa+kaTqwI9I+JDvpAirsjffwW5mTb9J2F4IflZZLEMIia8LHNHq8rH4enyP71wf86q6FRzlpUgjLza25XGKgOLkwzz4YqoND++lv/EYAy8BvcJr2L8jT/hOCE+dRuCPyNR/0bnl1iir6ftlI3sUDZkrAsgHRjomdnZV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/Jksd7w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O8hTp/hq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/Jksd7w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O8hTp/hq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698AbSkX2290256
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 10:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iIe2IgU/kimMed/aKEcmuC6/
	F5VtbmEysuL1bs6SM04=; b=m/Jksd7wA71JMLA+vMNBSXnajwlkJCBcyVWZ0RJw
	dzo4SpPpNspfL+kaYbYJNL/tWaKLuR0G8Cq2KLXFZWMZ1NmcttKdJwZA6zNiF4DI
	tHMXj1vQODfvlXQFfWtpoXOfFaWxI2R4hlLZqcu5ndZwYw1OnX1ApZToMRZdz7R7
	KwlqKdbQiN948R16fQjcGNmnyFFE18/aU0O9OjLwszDy2T6zbrln4arwvEukoGFR
	NObKYwdFZm4V9HLcmcWtYOZdmdeml0f+O8PwpJrRZGw3xjfuyk24VxEwPcjmnWus
	Rmvy5oqPaZ+c0LTBPwC5WbjXNs66fKgPCdbE5JQ7iQVVTw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jmck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 10:48:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc5f70c8dso582216085a.3
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 03:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791456497; x=1792061297; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iIe2IgU/kimMed/aKEcmuC6/F5VtbmEysuL1bs6SM04=;
        b=O8hTp/hqP1Q3q/DujBrx5xB88faKfbRiCjLiry9Koj0cINFv8x+FS+ItX6BfRo1S7w
         ZfjKpfUg3lj3caRB/kW+s7+vvsgVc+YxS47wetM1hH+Q0hJiZip63Lqn5Pf2HWvV0Nbs
         CujAbAKemqUUMrW9teCyHSr3gVdOOu8mffUbizKh0RCQ/XqP8dVkJqxmo/NcR/2b+I/F
         bDMIyIKKT9Kg0RRmznRkOHyAUodvKUVjkKPx73ArhGYaAeGZwqkpqNi4fjebxbE8srSs
         Ki2Sa/2/Oqpk2Qo27RwTTDB4MFsNza4z2B+RCDLzAXJstzOnkD3sLX17OdMPpNLICzcV
         pbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456497; x=1792061297;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iIe2IgU/kimMed/aKEcmuC6/F5VtbmEysuL1bs6SM04=;
        b=gzvCI9lpuVlZ0kNkWdU8VWNzHjiE0CFHqix9YNMALWFg25VaL4EnPPy+uzo42Y/YdN
         /EDomqPndByC89LrG2ZpVyL7f9PfSkrn/eG8Wx2Pj38SZkutFNGBK3ddKSgB3bb7UrNz
         K72A+zX2Ura6IDXcbQQqUE9fBLpJHYPNYptcnGyTAwl8k/KLrc8NeMmd+8Tohriki5Ph
         /YrX9m/k0cgp30RGnwjYl7tfSGf3FgwxjUQs6yx9lF6WhQ3bIOu88+8etl/uf1jmlUbq
         unBxHPd3TrXv9lqtCOwEGmfKjhJ0kocBycooVHE/t/JnXhoXd8g4b7xsjZyJsL6b27k7
         elPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcKLVVoIvKiwa8kYeXp+VicC56jcu4o9+AvkaYJTYiA1WEC9ESyKgYFs7H8V65NwLi86SF7AcpkfQo@vger.kernel.org
X-Gm-Message-State: AFuF++ntNIiuU+K/2JsGgaDCX8WXGUELhppWMKruMTBUDwb5SJNNLkP4
	3c3S33Ev1KPK2SviYFyRNViF6VLRvSc9KVzVQesBj+zA3EO5Ghw5cmHRXIpSxRH3HNFJGNpaMWy
	XrT1/y6BQzmX4f0cjSvs3nTPGu6+aB/JFzF999S4ihldNlYhoCiv+7b7clGt3B0HP
X-Gm-Gg: AYBFou09WWZeNahYbp7yFzREs7RQaeR7tyBspaI57TF4pNactujWcY92hxdaNfR6MRl
	cW5Mu0uMEzZE259DOg4S9or7zZ+xERL4NWGj8bQ+XJeD+U+5NJAWuQYrgl1u/TjkDdM2AODD3rn
	qmo/irUnL2VkMSr7K4EI+b1Ulm3T9hWMZ6RftFGPFp01FaEiyj/hRjqopJ3FdzuIDg0Yw6/L7Hp
	ZTHX5tqji0w6mFDtw2of2RtrDJsjtAHGv3v3oRu4+xZXURyHgy0NZwSqQMg8uDwL61EzQ5VtVJX
	HlJv3ps5mSH2E+gYTp/STXe72fNSzCNxtPeF5aQivpyUdPBw0KyBP5OkVjD8jRA9hu1Iysf4oyC
	sNM4fObapYOkoebRcDAsvwiKZJUFv33EJfZSDkPBSKOJj6LyvqstIhxpDvWQzK2M/TqAnZ66zE/
	93Um7/qrfM4+dP
X-Received: by 2002:a05:620a:4110:b0:93c:62c4:e2e2 with SMTP id af79cd13be357-93e9b2ea33fmr846194585a.12.1791456496907;
        Thu, 08 Oct 2026 03:48:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4110:b0:93c:62c4:e2e2 with SMTP id af79cd13be357-93e9b2ea33fmr846192185a.12.1791456496373;
        Thu, 08 Oct 2026 03:48:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd30a2414sm1086537e87.78.2026.10.08.03.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:48:14 -0700 (PDT)
Date: Thu, 8 Oct 2026 13:48:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
Message-ID: <ldt3pvb45iwedogcmcilcfcwkgntkqragakh2qxsfpk7jz4bw4@zc5yi2i3cuhe>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
 <20261008-08-dts-v6-2-f9c4ec8664d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-08-dts-v6-2-f9c4ec8664d8@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MiBTYWx0ZWRfX8cbZl2K/dRjR
 e5nPFLkS4f+v9oN0cY0VMqZKF6BkFRuv6wkLcONQWjkDTQ0KIvbIkYz8RRtSj3pAvPQ0hOPfE60
 H6Wn8vWmwcVzI+5jEN18WAH1xrbjRBc=
X-Proofpoint-ORIG-GUID: 3EiU66xhA4TPylwQz0V016vnNd6Yj_PH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MiBTYWx0ZWRfXwhyN1+R2+P/Z
 tIRRZiSSrLGUKZsDn4ZmqiAuSdXMgooqPcpKeFvaqDTT8PpRuGEYZiCcNK4sYrPr/NKWQtViGVX
 aUjyZ7d4LaM2ma/aLGORmMhk8PTuPFQu3cj3nO2Sb35TTSfPsdntVROPcxpxOkwaehwmDqGX1fA
 UBjqwfNu2AH/BKKSzcqXbKmPO5ko1z4yfrjnfgfz9h9WNpVElCtRSG24GLMm/ix8BsxWTXzAl5u
 ot+yXcyIEYVoLAhAs61L5Hz6O9aouCasCOgF03Norl1Ocx1OAc+TW68DO29uv4meapKRTYneBZi
 RXz3co8pk8z7AsXyv/sFlsE/3qc2nD8IS2352yAQqhS8J9O4GY3A3/oxEUJ2PD6udxbXQvY+0BQ
 g/N+bufDkIFBIG6HVBUVHBXXKy1rmiIHv0i4OAQaW+UFfiOKd494Qz6C/TLlVQqIrvyLETrcTIP
 hBUhRgX9fqZ9QcfjHJg==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac774f1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=qsMvIBxTQZfwbozelBgA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 3EiU66xhA4TPylwQz0V016vnNd6Yj_PH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080042

On Thu, Oct 08, 2026 at 02:44:22PM +0530, Varadarajan Narayanan wrote:
> RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
> share the GPIOs. The board has to be reworked to change from EMMC
> to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
> and include it in variant specific DTS file.
> 
> Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
> and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.

Please don't mix refactoring and the actual changes in a single patch.
Please split this into two patches.

> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +------
>  arch/arm64/boot/dts/qcom/ipq5210.dtsi              |  14 +-
>  3 files changed, 218 insertions(+), 71 deletions(-)
> 

-- 
With best wishes
Dmitry
