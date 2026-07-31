Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297C33FD129
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498863; cv=none; b=rMEQzjNk650jGYZVRWjJPvvz7Z4wEAEDgCMsAVa4mzqDmLk3uSnx+f3+mn8tdH2sS0xywwd3ktNG5yFvxYE7J9isc6c45Z9hWAku+PQdGi32EsbyXKgHMBaKOrgWWpGaCNlP1iJt0+DO1aw9xT6V9zczjkVwI1pF1AkcX5UnKUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498863; c=relaxed/simple;
	bh=IzQXO4bw1znijVvOeuLNjQtxOwXSBx2VmnEvTIcRN84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VapmF89ZdliEcTHwokRdpoV0rz7wTzbX6PDryRhoA+1ybKnFbqFejw/RQ7TolmassUmXDyhXTqn2I9W7h/iMvTBxkf317v/zIr0LWVI4gavjAtvU/teCx8YaHQ3rxMicNbK+8EkeQ4J9p67fA/WgxzLaS5M+BmJFOqNXNOUpHh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eBMy9otJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dq4EkvQD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eBMy9otJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dq4EkvQD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBmAZU3905281
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CNN38XzctMaiPX+j0ATyIw20
	wZmKlDeQciUomHjio7c=; b=eBMy9otJpU+sv26D+q88s0EhkStAT5WQ59Wmv6Kr
	gT1+57qszhC3zKisiqV2sVjw0NqxYndvMWSXA9HqQYUWmMwqqtyXPZusvsS8b9yc
	GgqqceFzgtOfQ7M8r1mjr0ww65elnoPhK9IDS+Eggx1f4uI/CCXzt8ToFZIWOLTU
	g537dJOdMNHKJdFZrBQhg04n0TTWyd3AR66qfZxMwvk6KLZu+cb6pqBcC4+YAw5X
	5nZU008NiUsr1fNphTxwuPrNuuGfOk2JQ6uBAczk8qcaGAkIQCqtKzOaRBnNMiWn
	oMB50OvkGScj8zmjp2/pZ88kRfqCC1Iz3USOr0vmfuHqVQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru5dg0tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:54:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so53954885a.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 04:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785498856; x=1786103656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CNN38XzctMaiPX+j0ATyIw20wZmKlDeQciUomHjio7c=;
        b=Dq4EkvQDe/sasJdLR2ugvYMhMybKB1Qp5kmlzxbiCTKtnynH9mJXdn4fqsQNYuR2rc
         IJx7uJ/le1eaX8WamoLcRJGut/LL5SRKF8c9BU9VCn9wzQpBrPok8djiF6kYl4OSL1Pm
         frQdNN2w6OyfzU0af2XNlceh1GT2/rWp9SLAdqy3mBMyIDt4c3BJ6Zw25SNXruleZxgz
         m8EKpJ3YAoNhfOi7KB+A2rPfgK1tK5pXEsmIsrrCgB+y0zDpP4ZLv7OzInd2z6SQjshE
         mupmqEzfDQjMBn6bugzVdBvDWSiMKduk8lUJBNddF751UloWH5/Ndmu6RCFub2r7GMLM
         TeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498856; x=1786103656;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNN38XzctMaiPX+j0ATyIw20wZmKlDeQciUomHjio7c=;
        b=Oc3Ew6BQn7a+aUV1FikpEex3t9rBrYEvV4c/+Kpb+G9MMOOjytfIJoWjNo5+xMHtsy
         JMuvF/F7A6C2lHU3gHFKmmLqiTFFT1gfKERntFOYLaSl376k8LwB1BZN4EPEzSyt2AWQ
         GxKwIe5/efGS+IYqcW5ih39rES5VRs90lV5BXZszR6YwvrkMIVX+KnYuqaAo5Kzmpz1f
         /8YiGryLKQl+6+yuzxjBv8zspEbSiTITyab9VLW4HK97PCvJ9oFFj7wh2X6evXajuBq3
         cFoDDXpIMehWlFC+NhG00uvLq2mA/rFqGL1vAj4lSv22zpk81SVemPC+OkGMHaNLYN6s
         blDw==
X-Forwarded-Encrypted: i=1; AHgh+RpLKWiOM2GPOH2Qkx/zoaSWTKsW8wj7669SV66jsB2ldVgoHiKNbLBo4b7kZG3ZjpMzghxie8jhR4xu@vger.kernel.org
X-Gm-Message-State: AOJu0YxdLtL0XgOkQxrTSStLqArohVfDAiPzAYfxXUNwlilXP+/HcWAI
	wwfurkK8MCfFVK7tuo6SoID/0p9xW+HMhMy0GYBsu2KJ4KBWjxutG3t6a/wPIQLCb5OhJDfYUjR
	esg6o1un6Hb+Q/C7T33Wf0aXA3Gp8MoZBVAWVOVyw9UsOrEEppuCAcYdv1hzj5gc+
X-Gm-Gg: AR+sD10dmdW47+YGV75ZDCxuQ14ggv06QEj4lcQTCxTwC6mi/FIQ0umvzgkgqbLx+Cj
	G0k0qX5bCrxCzttHwaKdCim2GBcYiTEsdOsn4VJYvpa947RF+fzZfvB0pvTFIZ897QroCjifJWv
	8waserAv2T5DPeXNkzfnewHXbljPSZqRl5l57fk0Xzdgb1HD4ceVB9Nlzql1kNXe2Uk5r8Dwhkr
	nJyXaDIqNLy0JIs2vAnYSdAZpre8hi5/N/fvgBi31k3SvJC9suuf7qzlJtP24JQPiG+HPWmn0ZG
	gyu67NcQUHbF/w+YkUoULUm5XQXC0kDhEnQ0yRQWUTanOiUghlvZo8e0yd82JEluS0EHXW6/iKN
	p3LhRy/E6NmVeef0=
X-Received: by 2002:a05:622a:4a8b:b0:517:5b2c:6aae with SMTP id d75a77b69052e-52b4aeef489mr22970171cf.13.1785498856193;
        Fri, 31 Jul 2026 04:54:16 -0700 (PDT)
X-Received: by 2002:a05:622a:4a8b:b0:517:5b2c:6aae with SMTP id d75a77b69052e-52b4aeef489mr22969411cf.13.1785498855423;
        Fri, 31 Jul 2026 04:54:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91bfsm4467318f8f.15.2026.07.31.04.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:54:13 -0700 (PDT)
Date: Fri, 31 Jul 2026 14:54:11 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: eliza: Add LPASS macro and
 SoundWire support
Message-ID: <vqft4aoqantmkymrosiikk7agnl63bbb7o5nq7iwuxul2qry2m@oz52ozo53fnb>
References: <20260731084032.3106477-1-ravi.hothi@oss.qualcomm.com>
 <20260731084032.3106477-2-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731084032.3106477-2-ravi.hothi@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: JiDTT-4Q7g8YdA5JD_LYEIiSClAlqcPR
X-Proofpoint-GUID: JiDTT-4Q7g8YdA5JD_LYEIiSClAlqcPR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5MCBTYWx0ZWRfX9NlHpbpMucnU
 NXrO908LY/YX2ieyUC5O1KEbxl/CqotynM/+uQbWAed1QW6v4N9juaNWDEzIt6wDwpcTRMTCDk+
 pDBD1KmS5Zn7+dqbVSLK9pEBiSmZv5r0k2Z7fhkgncZHHAcDbY6+9j+cUFjGCYaCQZ/dXfkat3x
 /94NeiymhQHvh/hbj/8LFCj4EFq4nrNO/zQOyimidyZGC9HFjyTUMiLnu+rNoedj4PwTRQBmZum
 cAD1VCdSsunQzpCLlm4R4LPe9lovCouZ795SWRgQS/KjSoZQ7T2qcTJb2rHB3n8iQbN86w7yRo1
 q+jHJ/8O+MmYaQrtDV09K9egnsGAPhRjdmG4n5kYMuH02AbhEvhi9U4JNAizOhZEWMSybpcwGxl
 jesRxsVd4eCdrczzDg1m0fN+NmEF4raMCS9v/9CvzTxjkYnboeJmQJRm+88lAvBVsCqK6FohuKy
 9IBO8ucAv87nF91nEHg==
X-Authority-Analysis: v=2.4 cv=SKZykuvH c=1 sm=1 tr=0 ts=6a6c8ce8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QXUQ5p6r880U3D8F7JkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5MCBTYWx0ZWRfXyY8ny+2WWDRC
 LNDPlgEpjTCAojwg9JqM4K3+ylBq0TDi4F0Ll6fHFBv9a9F4lFS0JA6GD7mfVQ2RRqXIIAlAC3+
 r9FBayI/K+Y0QWfdmnPQs40qXnjsrRQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310090

On 26-07-31 14:10:31, Ravi Hothi wrote:
> Add SoC-level LPASS WSA macro, VA macro, SoundWire controller and LPASS
> LPI pin controller nodes. DMIC and WSA SoundWire pinctrl states are
> defined inside the LPASS LPI pin controller node. The hardware is similar
> to the SM8750 platform.
> 
> The SoundWire controller is kept disabled so board DTS files can
> selectively enable and configure it.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
