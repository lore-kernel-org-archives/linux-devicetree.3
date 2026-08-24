Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0393E49E6
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553174; cv=none; b=Bz53zlFy3XIVKLpSMFQxJSvA2MOJiGcDwdNUPPNAxI0cLZxOqdcficMS0qIovqoGAq4kuMBxRYCdiEf7Mn8Ub0d3r+CjEF2VF8s+ylZeJ4V0ozTV0K+tU83QiU7CXpx7zNo6U+zm5SzLvUFdOIMWo8SKBzf0OAnipvV2OF4D3GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553174; c=relaxed/simple;
	bh=syWg8sLJMiMY3ZnaxoaIqM1ZIb7QIUvi5ZvMkQfPIrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=POjaKZJ86WaGul9TNZIAf7Bbp6A97u6fLailBepjsZn4zeM13yF+rY5Y/vJ5gny0KbhRZOkU6nulPoK1xNvi28v5OeSfNmRV1WdRp+ItOHGakrIxHYsFHzEyz+cnTat3u89RD4nxpRd5xI+5k16RnZBL636F/HVb1Q44i+8lOFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQkGXMis; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7z+lFfd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQkGXMis";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7z+lFfd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O67ae31662542
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zsWuTk19AfEdQatolBnlwSa9JrBBEN3NWLkZB28HQ34=; b=cQkGXMisLAMbwHrA
	Pr/3HK3FygWdY7riRf/M1xY9oDlCJmpiZtCmr7JvyTiJbPJJqotlW/wq3C2XaIxx
	996HTlan3FvrWU3oJtCaq8p/KmwvhqfrXGcHK8qm5Gv/fLxhnOBaEyD07y6LqMAc
	pu+JI4zG/b2ZgtCAEquz1Kk1qCCATdHqBXeowcNqb7oOX89jYzlyScYF+E5cPqs/
	dx6wK4Fp5piDCAAlnI9PO1jksfGQeLkVry52bZSWtMVOYJyHPQVlaytiR19E5pYr
	McGtI42e220nul5taZs5eCb7JTmdlAFpkl5FZBRpk6+wPmgeT+/WmT4yu9ZR1FnG
	ojyK4A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdsg2jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:32:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c9e97b626so5346781cf.1
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 23:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787553171; x=1788157971; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zsWuTk19AfEdQatolBnlwSa9JrBBEN3NWLkZB28HQ34=;
        b=E7z+lFfdU6P64mvjwXMVg5bs8+57tIEnitqEI5pqrCXSMbCutHiT+dFrgqaV9SqKfX
         9VsH6XFwXtjUtjVVocdf4UUA9IVN3bQP5SkkzWewXpgdcQlLv8QMFnH7ZRGDBpFIWMV0
         Se+LIXqXqOu0zf3pDZBGHTje+hr5wUVNbotQCuppc2TXv2dk8nNOOHUnfadiMbnuV3tF
         8zcq/Ib8MP9eh4V3a144B2ZSuepfxKmMALVufuZ5bKfL4rPBnpMfu9qRaEwtJa4rEsXd
         mP8ukyMW4JKgpzRLnobmsLAdSaVjHRBuwFvg9Bu/2YcO41hEkiM4G8SxfxRu0BC384fn
         bFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787553171; x=1788157971;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zsWuTk19AfEdQatolBnlwSa9JrBBEN3NWLkZB28HQ34=;
        b=Tm2N9jCx21nWsZNXCuajAzGWmdaSW+hpLf7lcQ8aujgfYRitk3HrZyy7idqWS6YDiq
         3/JLoyLQKj3TgEbOsoIi8Yq6IT7dtF32CRDOFChb1m+N6JkQR+a2WoE5099yHbufsI/C
         j4sRTyO3gdGBefCgAe2XLMauEFIt6vcRtCtxexfeNyoGR6fGwrBWN3ppFM827VE5w4SI
         Tj1mB8DsIG3qEWElk54qo8lcB2k7bqx4nFPvcf4bfIXsCOOXj8sv8c2g0EhjPoT1BjKJ
         LP0sVZAPd1QsOLHbCxkG4I5Q7EX+OvLZPlmBxVEVB9Mea5BcGZuj+CcGICI44Yq9Y8fL
         2DwQ==
X-Forwarded-Encrypted: i=1; AHgh+RqcvyW7pXYXBVuINJbn3Ao+SMN4gzs5IsbXfgmZRdxOYCNyf+e+WKEluRns6rYvK5PqZOzGCEsWsigx@vger.kernel.org
X-Gm-Message-State: AFuF++kL3q7Tij2TznEVLDYBDOvzvncxXF3j++nUSZOl4BspaFrJdmYm
	FEkBbr5b/cjh+bG+65e2EwOz6pwMeyaEsX1EbX0NM8Pvw3oHg/lAn16LU3lZojXV7SfMfDsea9P
	rmXzzzSNbii0bcOT2SRWM2fFFS6+HlCOgks1HfkeSADuSP7uevjsZQeqkXfSDKN4Y
X-Gm-Gg: AR+sD12KN5UNuy/G2QD8poImL20Nks4WLXDcK17dfE3eUXQKuUHt87nKKJx8gx7LdeB
	9wjTWSvJMfocHr3wad83SuJy0n8T8Mt1mIEfEq9WXd9hdg/lwCHRretl2UvtHDtsodXdJWlSjrM
	+TYH59z/aU53Z6cVRqaTI5ZEXURmqzm1QGf7dk8RAhzNHSRvIzFr+s/k69/a39+afHkLmMeCI+3
	tJSDVATl+ZeoskHLecAKzLKUii9pPNCrYSDUdMWEOKUockdST8NqBhi+Edie/RmYIMleww++DYr
	U14vgBXird3SnhUq70Z3Vzzy4ajHwMzmIBTtq7OvA35I8OXz/nJ4W9Szm9r1MRK2e6tah8P09pX
	fLsubXfBXwpdKO7OsKe9XlINL
X-Received: by 2002:a05:622a:1ba3:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52df567630bmr175223881cf.1.1787553171060;
        Sun, 23 Aug 2026 23:32:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba3:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52df567630bmr175223721cf.1.1787553170623;
        Sun, 23 Aug 2026 23:32:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24968a2183sm1060232966b.58.2026.08.23.23.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 23:32:49 -0700 (PDT)
Message-ID: <95de411b-0b6a-44e2-b343-fa557a917e9c@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:32:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sdm845-shift-axolotl: Add
 actuator for second rear camera
To: david@ixit.cz, Alexander Martinz <amartinz@shiftphones.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260822-dw9714v-v5-0-502bc7f43b8f@ixit.cz>
 <20260822-dw9714v-v5-3-502bc7f43b8f@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260822-dw9714v-v5-3-502bc7f43b8f@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zUXEZGX7k0o11jzJgDTHN_RadrrqXdpO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NiBTYWx0ZWRfX7dCUJtliHygX
 /JV6N3l9nCOd+UYKWGqFeaF0xvqAniGBDjb17aDyZ1oJlMpsN2aDwMo7REXq/9211B65mvFV/nm
 50henbxYPc4TdWHyoltfeTrZUz31w4RNAmNjjfzmfgzQgQS7LVMPVupp2+Y6xh0HVu6qJzZf6I9
 /VjFdWZUA9zeKucO8iVYQ3UHA7FxUvYxxGZMklo7klw77TxTDU9uAqu/2cH66tzneDIPHs2/uYA
 ZOUHODg694zUQ5ApzgoC/PiwO6IL2XeH/OrrDu4ndkDPfKUxGHw3O4Ozn34tn0M8WsdVmu5bHn0
 ZB/mKsluoOgnDqNRmw7iZuvGIX6CLbbHeBclsbNywLqdSZEvHZfGHya4x74X4YoHKunPwj61EaE
 2KZCLtCy8d4sAqZWki7WBvnULeVXNxxrwCDhNeH7JzVgSHfJm0SFKOH6G8G2qxbD2RfwNRas1Y5
 iUGU5LGgM6zEzBjdgkw==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8be593 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=SGxFASbRf4WqgnW55AYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: zUXEZGX7k0o11jzJgDTHN_RadrrqXdpO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NiBTYWx0ZWRfX8Yyh9oqgdtNe
 RFzPK7RZtVK35BybelsIzrWoyiZQQ1DhZvbFW77JENX4Qbs4K5WMR/7muUezeVuEtGY/TFPygWo
 XDrUYEUVyQ/izcx4yZRgqdU4QqmmCgQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240056

On 8/22/26 7:15 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The SHIFT 6MQ has a second rear (auxiliary) camera. Its autofocus
> actuator is a Dongwoon DW9714V.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
