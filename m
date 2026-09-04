Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E6B4FC8D1
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 16:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537827; cv=none; b=bI3ju677kWs9raBOXfWdi/yZM7HNoqv3nswXkOsacHq+utf7FPDlSlzKjwWzvyHBXGwKUTmX/+eMmi5+nSgFmTOQTGJJpSVZ+tpe0k7G8dUOw8qMxOL6HvNb+ER14A6vrhMXOWi+PSK6qEErNIKRoUx3564DEwtEMcSIT61qZ4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537827; c=relaxed/simple;
	bh=6EMuGemNxkodLoVrJas21TkUtmgw/Ztd+5lOhHoZN80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QRLOEf+9DIEoA5aSw2oCngsCkDvTANU9g+HDjA8JckA2fOEjXbn44K2FTmKPYsKiyfhUz3m5/C+aIN2Gm8Azz3Bh2hzzbvjbLU4dRN+bWqSTjM6oud463A+O8s1pHEuOQFB44CZVp+0GmGQsaerYJyy8K9xIrzebkvRlOBEezxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gGIVfWl+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APR767on; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gGIVfWl+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APR767on"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684EiK4C3329476
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 16:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ubYpczf2GYl/yIKlMJT3YPKv2d7IuBc85zxyY8MBcf0=; b=gGIVfWl+IVBNqJxk
	KVKIXihnxH4Q6/zL/90Oy45L5JSb04b1GSjLmB1bE+vtZBwapNTWWJV6PEt6N0uU
	8dKz2ADKywrN6I/8IDAvi0jtZ6iXvL0a897tBN2+IEfSnrbI/8d1Erzjjt+hnu/V
	AWrBFdmvxunF+3xsqUhgkdWTRK6qdF2kjxYkfDko0KvWd8r+lNiuDnauIUnbWpOV
	EUU4RVZ8l5FEfqyegCmIUtu0rgEXnwlAv/em1uc+6meMhXKRwPTfk2zqtFJpLjvt
	FN4Cubbm/opSqg4YFHUOwr2RLiIwOMzeltyJWltXUmbXugC9iA9z5qO3jYls3aNu
	bQQB6g==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg00y8bt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 16:03:45 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7f1da5e5b06so1754782a34.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 09:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788537824; x=1789142624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ubYpczf2GYl/yIKlMJT3YPKv2d7IuBc85zxyY8MBcf0=;
        b=APR767onCHd8gedYA/rgitlsHwyGBVYD/q/HPnvE6U3SApeCDH1eicp6aZuMPs4Yz0
         bPrCYes+EJBY16YUDHOGXlxOJg/Pe/G2GYSXI4bQHVbPpdKaEoaIIKU77yi5YigTViAn
         ht6ubYlGpbYtVe2mhxDOnhtvnq+CEZQSNNHIS6BjNxhMiRwiDS9g7No5SCGh8aEGGwXA
         PFja/t9yOVIoK3OH0Bbt/arT4n9q3NOqcWas3P2fGWLAUo7PTp6M+WKdXs50UL/dZWy0
         6ztgwXhdfpO9GE3kU8kkmqoeyxPo9p03DCl2rP+zMVw6dbvOgjEXHsVK6Eez6KziduRk
         uV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788537824; x=1789142624;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ubYpczf2GYl/yIKlMJT3YPKv2d7IuBc85zxyY8MBcf0=;
        b=JCsL7ENakgIyEsd4t+wHGRRt69nz39Zc6TER3BLhMO0I/ybsA5EPhPs5AYXvjyowpd
         ynCV8siEfzB0kFi6zwGZ2Dg1/gIlbyKo+RZvJvGK+/lMAso8iVulRTReeiVduSivGAy8
         pCLYOcXQiIFhTfchlA1a9faAuVAz9bAPSZjY65J6w1HLqKW6BpoEK2xz+nHUEDWSUwh3
         b9++DM2PNmf19OaJX94MlraIA+6aZ6hJUtFktYDHhJb3xYv7Fpx4rm8ulENhxrpLMq/D
         OfO5bqUWCWn79U9rVVL3wn0Ce2ZrpdW06BlaEpzmHFVgkUi8JM1sZabqF/lqYWvOibbr
         3Mcw==
X-Forwarded-Encrypted: i=1; AKwUvBx00p09bekoREH7n0Z1w2Xf+cIp3QY+DURKRcAbpAzNHnVWSoRLhFuHwayYeRKrfYHxDHhTjKFduQXm@vger.kernel.org
X-Gm-Message-State: AFuF++mLHkz4mMaFEKwT7X5oLfTT01Nj8tB2YUcpPGJaVuD/b9ZbcgWN
	5J50cLmlLcjNkJ9iIhKaVyzUdCrrnPJzvN1vzVpQkaONLWiem6Q8ZO6u/2HIf2XZeNA8Nk/mT4+
	ufq+5YCWaqN9jbzErNYgkKLa1YCYxA7Iu/smjhux+PxqMuP0xOqcOBkJaJr5I713r
X-Gm-Gg: AYBFou2XfSim76phq8Y08HTMGAXJu7Y9xyKWQpqSNEF/HJSZXFrhvrZUHwYUj7MWr+q
	06T7S/RnuHOnPtEnvncJPc3nr44JgYN5ccHSd/bGOfRm48atzb7xIKZPgSgpwhcoNKhIzDGPLWg
	w3Cx0SI8Jgy2EeFQLQje3M9/QhJ7tQ4JoWEv5db9pZdlHPDrrnQOcJ9qDOdxSqUXVcF30WRmo14
	k866nWHQqBGL15RgwgJUUbKzc9EqLJepoRSy3/SWv3Tf2bcSRc4TFbfAjid7czbRlj0wv77Ylpb
	fVEf4hs/uskeXAsJTxDcRg+oXnfhD+XeDiDWFAp8VABgMUzDJKh72uXRZPwO00Uj1lxzzs6kGRB
	PzGckB7fpsqbizbfqRN9TtQiFO3FP
X-Received: by 2002:a05:6830:82e1:b0:7e9:dd7f:7a83 with SMTP id 46e09a7af769-7fa1b1e535amr5568043a34.0.1788537824550;
        Fri, 04 Sep 2026 09:03:44 -0700 (PDT)
X-Received: by 2002:a05:6830:82e1:b0:7e9:dd7f:7a83 with SMTP id 46e09a7af769-7fa1b1e535amr5567922a34.0.1788537823727;
        Fri, 04 Sep 2026 09:03:43 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.21])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f6793f53sm3195659a34.6.2026.09.04.09.03.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 09:03:43 -0700 (PDT)
Message-ID: <65c956d1-eadf-4bdb-bd66-0530421fda0f@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 21:33:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/13] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
 <20260904-x1e-camss-csi2-phy-dtsi-v5-7-dc81d85b599d@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-7-dc81d85b599d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: joXSajkWdk0qfVCgRfpAN11PUCzEM1Rl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0NiBTYWx0ZWRfXyXG3WovLY0eQ
 0r1wms22wYv4/1CFcmnKnWYESZlTCM6pEMmvdDBevC0iUZ7jothnzxY6hYxC9zvjmb6IKLK4iiB
 VqyxuXT9c1FPPSVo8IZtHI0CNTY2aCkyuni6EXR+n48Fr0DE2Y/t7esGP+NR5smako0CzrsPjlQ
 gQVvkjic+8wu3uNBbdkqZXkIE9NmwTm1GcaU5/QApd5HVTQsNtIW4bwwAJe/gFcKwZu9lSRVAhw
 /79bSZ0rLSZyAZ7+K1G/kK+Vw/Uryl3KrdvKjxzPfT9aLmOmxgalPdYT/lNRm243q9iqWSQPHVZ
 JbK8VK32fYWrxGpP/4sRQUwsm5+ZxEZNl6+m+oi2q17Zv6gOZOoiYGWlqE8GUftBWuLpU6GFGiB
 EcfkFHno3IpBIeYSU1mvwkO6bKMD0BTj9GREUfSFoB2Ly4huBPWZ1tLUiqEw8cFtv8dPFHdFXC/
 D7g6sBDGHIi7AFRgFSg==
X-Authority-Analysis: v=2.4 cv=TsPWQjXh c=1 sm=1 tr=0 ts=6a9aebe1 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=UQytLGTC8N96CC/hvWkJ6g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=sbdT_ZAiYm_QAtLiiUQA:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0NiBTYWx0ZWRfX7fFEBb5vBT17
 K3tnmlJ2ybRm2jUfBzZihz6igwzRmZKzt1oiZLHkI/BI0kzg7N4kFZEFkXy3ysTyLwAbgeajSEd
 BDjkEHN+F/L4XVOpuYwTUtR8wasFZyk=
X-Proofpoint-GUID: joXSajkWdk0qfVCgRfpAN11PUCzEM1Rl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040146



On 04-09-2026 16:26, Bryan O'Donoghue wrote:
> +		port@3 {
> +			camss_csiphy4_inep: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&csiphy4_out_ep>;
> +			};
Hi Bryan,

camss_csiphy4_inep has data-lanes = <0 1 2 3> and csiphy4_in_ep on the
same physical link has data-lanes = <1 2 3 4>.

Shouldn't both endpoints have the same lane numbering?

---
Regards,
Nihal Kumar Gupta
