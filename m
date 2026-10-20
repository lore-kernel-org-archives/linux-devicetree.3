Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500785;
	b=abmU53hXvE7FgYuGB3CnKVuj/JVdlAG0Z7KmM0N375/qMmqy1tAzw2n7wwMnsJ2vd4Jw
	 rSb06+3s1xYYYFjDnyv5jn657GcL/VkemaONX2H7cMCedAT3LAHDvIxmQqBKuCIxK83ab
	 bkKzh/dPJXmzNfsWxORnELhCdRIRlOTAbt32lxHZP6rrls0ruTrGXirMSeqig7mraiXui
	 RmN9AfjSZGL0EwZodRTG/xafKcnyXxuvFk14h5efzf8i5xaDCqnGIjA8lFbd9NzQLa6sx
	 aC1SLOc/Nq9eb+6MKr549mX97FKvhHCEymD3QNWp4wkHgyjKhcMLhk++Q8vThquZ1lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500785;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f9IEdXDKhDYNUZze3bJsmCBN6Zr2GWDjTH6URqpvUu0=;
	b=2R/0hoku0I3r42gaysI+XoP5Wyf1//ZDWIe6uC6pTJ1ld4+UBQUa1KguoN6ogr4G42cQ
	 Liabk9rAiGmSkzqFkf8VuYfJ+e/qXoorBGBMk9+/5uaipuKQy1RMyIgbgJNi7iUbmMzxw
	 aXpUEA76dPvUNCvG5DbvZQzVPtRcCdnk7LGIn3Caswqe7QfyUV7jTEqI/+EH68L0sk9/6
	 VBV0ckW3beuwPu+ovWznVgY7e/U7LiV9Mj5mCzUXfJljHviBrYzgtFYumWGQo7NWXBNg3
	 Ume0+hXO0jMahgInN2CGXbrWhvHL2AaRMDmULP1wOIS4BQR3KJoqakbA0hxRawNHZYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="FKsBq85/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tc82hPZF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEA4606F41A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CEA4606F41A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FKsBq85/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tc82hPZF
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx22X599716
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f9IEdXDKhDYNUZze3bJsmCBN
	6Zr2GWDjTH6URqpvUu0=; b=FKsBq85//g1HI71xUj5krTCWHR8ZQpXIYBuW0tdi
	nWAIKc6OCcMYFrQoPtrI82YYRvN6eLYmyVvtGD5wqag7XK0o+Vk7Y4niJuT8cE+T
	1xLruJ6GdMJatM/6dIhxDL9WQ0akO7cvIbleLscpRG2XalVyUsLqUGva+Qo4jlqu
	r2QsrWuZIbzBWrYtZOtat97aErmKOVDdxCO2ul1v9/QRKoV9EzUH377NbvBp/tr6
	Qa0VWPu4teLOdVZvQn7lhk2+PCgiEOgA1afchK86x5m+nfcHzPWW+XHm90w0MJ7x
	h2Rim1BnSr7yTq9qPIHavLoWX4e15J9GEBXnOIUaUrbzUw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2gj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:53:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so654946185a.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 05:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792500782; x=1793105582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f9IEdXDKhDYNUZze3bJsmCBN6Zr2GWDjTH6URqpvUu0=;
        b=Tc82hPZFTMsMJg29+eXSJL1WPfVg5ElbUjR0wWffZe+5x6RJ/X5qExZ+yxlC24IuzW
         Ftl4uQ02uF1aJY9jD6bLDOFQUxioBIgqVEq8bfuQma4VrEzP3GmFvHTY+gt7LN2uHG4y
         9eCcpuepS7Tm4fatm0YvQTvCIjrFPuKTjePzTKNornzxryfs1vWp21ULFFCnngpTf7jf
         9QAti0lSV9V1mWOaSly8idCelv7qQvF1JojbyRQGj46TP4KxKKmlRC4N53DgLLKRS+VV
         mIiQCYESjBs8qZNBNNS/QT8OF5zcU5j9lYmuey/M9kEBBGsXtqF4nLGmI9w5xGsqK/L7
         dAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500782; x=1793105582;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9IEdXDKhDYNUZze3bJsmCBN6Zr2GWDjTH6URqpvUu0=;
        b=Zk8YC9QOtV0tn7U9I4FrHjl3vgxGL+yhiFJXiyBFIW3GL4z7xhGE2YLdSpPCsfWKjL
         zCsPidgXBq0wv4hxon8KAN0kIwW1D/6w0GVHGw9nqQjQDtxDZSvdvr3eUL1MLBp5oHSq
         3hiTDs0tQZPEDo8wGV524PHrwmPuK3mioxgmnikNYmt3aGE6qLQMCTgkVBc47UTF18xa
         3UWvXOtdMxxrIBIGRqb1RlyUgtPys5CB+dVMPJXTPE2r1n4DA6XA89hae7LB6KhSY3iX
         lzd2FOC3duAGtagpNE8lDcGr3AGuk2EFoJC+lXKDU7uzZ6DwNp9xGoVdF1CYOME53w2U
         ibhQ==
X-Forwarded-Encrypted: i=1; AKwUvByd+vX/LB1gDZzVgjonaoIUjLBbzkH9KkV2mL9DAgrOSNNM+0FeJu5L0aiHYaUXRdvZwtdhHekpk+jz@vger.kernel.org
X-Gm-Message-State: AFq9FYL2oYkNE7D6mJbvZmCvr0iaR0gF6ur7kucYrGOMNwjH+DWiVc7L
	fK8gr4t+7npDsDBazvcR9WjQe1VzcEisnGCg8IkK02ICSqiOLNOVkgGn1wRFeXJD/BDlQYx4yyu
	SpXKzkpCxrz+S6OAJKDST/IkJUQKGqTG1DnXKCTPVCPGHIs4F3zQbHIzpkGEKPKoJ
X-Gm-Gg: AYBFou0kjFrdDIwmP9350qz2xFz3SQv8f5KIbZ+T8sku5KPMstBafjz9jB8avZ2N/ph
	ldTQ31sAaeWDlh+WBwXhT4IWFcbEPyqXS6YGmXgi7arVyveYhytxWRjN0On80NBfYLPW9fMQHu4
	7x9sV5cZF6hp458kEyIAWzxslTFFl/q65HmyhTPILL9QE0G3crIXpq3TtQvLnNMg9v+MZ/ZYlX0
	ADw81h+mWBuoNtfXKeP3UQFZUvCSmRiPyLf7hpxQC38eQvc8mBmVhXil5S0yGmypBxLbispRFaW
	BFlReYQUuOnBQ+PVkxQHpoQXETqY2sv9WNXg8/4gAfUJMOvAFOvAUpx+97GXCUxTHTuZq7clya9
	KDv3hsgEnPZNviBrQ
X-Received: by 2002:a05:620a:6f82:20b0:93f:2e72:8389 with SMTP id af79cd13be357-93f2e7288eamr1036123285a.54.1792500781925;
        Tue, 20 Oct 2026 05:53:01 -0700 (PDT)
X-Received: by 2002:a05:620a:6f82:20b0:93f:2e72:8389 with SMTP id af79cd13be357-93f2e7288eamr1036120085a.54.1792500781316;
        Tue, 20 Oct 2026 05:53:01 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ce2b8bsm73302245e9.15.2026.10.20.05.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:53:00 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:52:59 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra-evk: Add GPIO expanders
Message-ID: <kfabsthyoza7b4qbkabimkvoa3xhyqvmkburk4vijli7mvj2jg@urhns2imyvxe>
References: <20261001-shikra-gpio-expander-v3-1-d30c1e8067db@oss.qualcomm.com>
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
In-Reply-To: <20261001-shikra-gpio-expander-v3-1-d30c1e8067db@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad7642f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=p-9omTesjESqsTKkUiUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX2DuOu0p0pqx3
 3JRh7zseuv8XJzOs9w5ArNZlgp5U/i7wLtswNRBP2QEMZOArv7jtrLJ56Rbii98WvnLbHm4Cb+G
 Gb8OLQT5YDwkUQaygLs4v25Gky8vyVI=
X-Proofpoint-GUID: _VPtpjvRgg28mXFf4i_9BORp6YaWE7AZ
X-Proofpoint-ORIG-GUID: _VPtpjvRgg28mXFf4i_9BORp6YaWE7AZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX1dkPJiNFOY9b
 IybCklLJiK9V343EUim/7Z3Od/+MfxJFY9ZefsDLXPoRVCHlTD+HxL+QgTkOIkkmsEBZ9Y5VtXs
 2pXEKjPhnM+jV2yfxV3CHuSNhCj6ED8XezGpuNNmFVcLCJpi5wq4fL0ZkEQw3M54vAXeQggehsy
 QCJicXKkx3/+wtiIR660wBZjYxFhHHSnyOpVmxu2WWtAZA3psdxZBRmMi99OlviBzoJ8IZX61BO
 UiYWFDoZlB8SMCEd6ERfPyCigiD8U8Q75uKERX0nhOCe+9ZM98Y01CrTyfKtNnNegeLIjQbznFU
 AErkFp8fK9ELRsVtAwphYkcA4W/rR+fkDlqo47OBNOPva64rSXpOy0HMTM4WA7HcF/YH3Z+35/E
 k3bjycoevsgCor8Kbwnju9Z0cZuFxFnbV7i+IolUXHlsRa5vuJqivbJV2pFL7ICFeDux12cfSXx
 C64mMesdodp+yzpF75Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200051

On 26-10-01 19:19:19, Komal Bajaj wrote:
> Add the EVK GPIO expander definitions on the I2C3 bus. Describe the
> TCA9538 and TCA9539 expanders used by EVK boards.
> 
> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
