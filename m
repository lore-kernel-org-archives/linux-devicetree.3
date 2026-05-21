Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF71383C6B
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357532; cv=none; b=Y1wUhgGmHpsW2FjQI3pRDy71H0Jtnv2lg3yxDhTQ7zXUThx4O9jQGrd8ENHo3MBC8vaYbhUQ+zFyjpQI3h5I+NfBZuYVcXZQo80ah9D5O2/ZnsltXctXD7v4d9VV3NP8snPPvBMN6y+R5sM92Cw3tIFYTFqQMHJ66UzpKCHJ7IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357532; c=relaxed/simple;
	bh=iwRni7YET8FxX6xbOUKaSqI6koM88c23NPlbPCikH+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oUKIABtjsNdjbVjVlzNwc0E2QTweoW2NWZgZXQC9OsjG+c6VDzGbzgdRKOD55bkqQWuaGeaCsqdriuBs/9DXnPm1WwMYgxnzHFJQ1uW09VyTZGoNKGQwhIH3cGvlw98mgdiIwFRE4KZGg3fo74jFj2Y9+g/l8o83D3cqx/TSGSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BETFWuIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VrlplDVC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BETFWuIf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VrlplDVC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99nNI3118648
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=; b=BETFWuIfh7Tg1vvP
	0h9gY1AzbiFMcm15U1aDx/VwdST+SIpLM4S/4Qi7+ab9IJKCjRG/rExsOW6nKS4j
	R32ZRUUCpqtgz2zDiyW/EEqcOE1JTsPAUGkdGy/Vt4CuT2uPREy7cegZ4iCl8xJ2
	aBkLif/yuevSUDOWe+KKslMpGG/Y0UmztwXKsAjRGKsHmEYtmtta24bAT1UGKL1P
	pZ+mVFRirLEHTIcMIvgrm3mwAaFlnpA6DA4Kbm/QOSQLCZMvVVDEAG+es/8sXrI0
	e+odx/wvKAZA4Oahp0vS1efiwnrs5/A/5/rsNaps6zrU/4KRd9YdLK6kcwH3rqNK
	ZLToYA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9r961ubn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:58:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90cced2eecaso131511985a.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779357529; x=1779962329; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=VrlplDVCXmv6wEPfff15iz5aldt2ze/2b1wgCMI60BgTZMNlMKEfBaESQjRGD5FkQi
         dpCbJ29mSW6fJ34FC++k6O4S0KZwEZHzcFaOLSdo9Xy+9YhyCDvUI7vaVXHSyFEAS5EP
         d/RxgosNqEiAHWN9JqeBH1s2YGUMP9dZulM73Zfy7S6rbcdbz7fAKKI+Ho7GK0anpoY3
         dXYNyDt6WEfdlzqOQkY65/quCjhZWbfQY/fltrZOd01aP9jojPpkq2H0VhtqbqkrbgL5
         bFOkEcsNWVNZJ7d1M0L+fsXPEVp9P0aA0GOMnnzjM2KCXIPty+hRo0751mzXWQb6rBWX
         k9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779357529; x=1779962329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=KHe+Vz9nxb156Q/wwubzuD1NlZD0hjx2CXLVw8SaqOKvd/ix+JLnaZ4YoQ4FH8zJiS
         W5swn8YGzUp5XbPEnTDEvFiCQqixKELI76ptabMnUW6u7YgHCen21A7jSZU8FWtvw+5l
         xQPJfUnINyddtxTA/PsTynBNd6Gd6cf036BOspJl0XGssEgSI56sAxLoqOBcrURyaA/n
         GF4c8FsU90LEMDjJ8LmX2S+raQH2izn7OI6pqIjbPMyEEMUQ5mMZPtXq6GnQNYm2Lcgo
         CvDPzEY6seha/gXov2IEPbFU3XiI55gW11YgL5bxQjvElOHxHzLNvXQex4AnGnY/1bMe
         iZIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8oyB7VTZxYZ1GWw6UhkXOAzXOvGkaV6escq1SV2ytGdw8aD6uGliml7iIv25If6nTU3K5czqFbwCfg@vger.kernel.org
X-Gm-Message-State: AOJu0YyhXQj8KfnI95U6TRq7RqmFeBF2ZcQK6H2BMJpI/p/rBp69OX3q
	jasFxlCc1gEU11+B/tp7bC8ooyetGLOyvJ9vlsirjqFZY9fAGIlRyHWC9dQkC9Orwv/Lj2vDwZ+
	UYjAxRk53DTMJ0fGs02JBFRvmuNbT7XZJqahq/VnBgfHjGOd7Ggh6dizdlFjSn4eu
X-Gm-Gg: Acq92OGsy9wHLIMh5KCve0zvaZde+jmJw3bubBF8j7jjO6gXcEjcEGn5lr5Xtl1DylX
	oltAGgTE55YygvyOvXDGW9sfY22CMMy1MYBw2Byj4sWeHKN1PVA42YQ/oA0qfVjJlZHU8neMpXr
	pbrXd97Y1HJY31XKEqVibNQlmZiuqhDNnOnFkjo6+sec70HjNJ9rPWjKPLXFjEQLiJjHL3F2YVL
	U3Kg5PaxhSnRK2h79GS8ZZFOIBvj2/ooR4kEfTWLcPePuCuTmMXoU6+hQl8qMi4XYM1Fz0psqI2
	eFUENgbhYqGI3ahZf/nD3HABzxuujCjhdCc0oa3TvVnqDf9n7tZ2LKfaDu3pByfyB/VO1rAr6/Y
	OKWpQqQc+KCJRtQZk+qaSq+PGkXW0E7yUi5aQVeNviV2P4NmY59JJVxp1MWGD8t9HqRsCw7+qqA
	5/VYw=
X-Received: by 2002:a05:620a:28cc:b0:8cb:1c69:b7e9 with SMTP id af79cd13be357-914a2d23772mr170015585a.5.1779357528874;
        Thu, 21 May 2026 02:58:48 -0700 (PDT)
X-Received: by 2002:a05:620a:28cc:b0:8cb:1c69:b7e9 with SMTP id af79cd13be357-914a2d23772mr170013985a.5.1779357528500;
        Thu, 21 May 2026 02:58:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6831197bf00sm9007743a12.31.2026.05.21.02.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:58:46 -0700 (PDT)
Message-ID: <3cf31aef-5fba-40f4-872b-9c4814074421@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:58:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm8650: consolidate IPA properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
 <20260517-ipa-loader-v1-5-3c3764c1b4a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-5-3c3764c1b4a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PQI0L3RO44C7ZWWRaGNEe-arsohlOZ4G
X-Proofpoint-GUID: PQI0L3RO44C7ZWWRaGNEe-arsohlOZ4G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5OCBTYWx0ZWRfXxZOyczo8e3Rf
 OfRwS7eNPOmYyOhzQDY0vv+5/cUaaMx4FXyrgrpnhgFoDTFBdJxFv8/ZHEz7Cz7p3SPNWMZousb
 eEb8OMne0bImtg73w3NBKFluqEVg6I4aLo6gZxfE9B3XDJYOjLEWorCyHy4rmzQowrOB1CW8azn
 VIK3nqVf9tuxJQ54/137L90QNw6j9jRj54EAyOx26w7bX50qPE4A66N3STIBLJAlYvtbDhKnOCF
 DrPaQ1GJe6ofBo8l7AI8BIKEir11G9UmvJ5UXmtvOzr+sM7KX4SKxR6RWpBNQrNfBDH9yR8/2Hf
 3Fl7NJqSfowCGefZrr5jo6rXtMjc2ezdvPdj7QMo0Smgh6FK0mAUeiUwFrYkECRltMfWur7+/jj
 o7ehtf6/LUxhvi/ZJUK3LEKHT99NLKy0qFr1h7pSt7XQXUx0ZlHI2tBYxC3XRkmlUwLIjcqJSF9
 aHkR42cgU2X7GbSnjHQ==
X-Authority-Analysis: v=2.4 cv=GqFyPE1C c=1 sm=1 tr=0 ts=6a0ed759 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2tTTa69PSMra328FOmkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210098

On 5/17/26 4:56 PM, Dmitry Baryshkov wrote:
> Move generic IPA-related properties to the base DTSI file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
