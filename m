Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E74477E2B
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 11:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905148; cv=none; b=DNXnb0VQFd7nGawMJuRQxjPQ4LlzQrfw7BsBSpPuRc//H+lNguRhQ8N1k5NuA72wqRVvq2FZB9xtsnzH1YLEom8SpgkBV7YlsMhKXaUAa5b/H6M5RMXMBJVOyvIv4Gnal/lhbW+ZRAgSdvVz9zRsfgDY44zmRYcOsNAD9zcjV0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905148; c=relaxed/simple;
	bh=XudXR1HBMbCADHdNf590L/1MSAwAvanH/ANUsrF7i/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ooY6sbLrjTLm2wupX5yD6eUnsmi/+uaAlcA+i7KYtA+03OuRPXtiLQak7MfWzpvMn+sIp7s0CybP7uyUs7mAXkx1aF9b0qYEH6N03yjIE9xULK7Znf+4Gy0Nj9h26qTi2soTTIglkwpCJRM8b96mXuNaDW8upyUOGZbj2U2/1c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=btvhzGAd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=URiIdti0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="btvhzGAd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="URiIdti0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8VEf644015
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 11:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AulWVLyhCXJzuW3ldtc62yyZS4Q+nukpT7VtxUpyNkY=; b=btvhzGAdmNTYrooc
	1F9eAqscwKm1HHKM7UXDptcJaErLjtVSKYlkyJsMb4P9J2Zr8dOOhmrwRXcp0LIP
	tt2XyWwCuhouPm/ufcycbmSpKTxLGpCzDTgvkMCzStIixJsBcIvN9ZYGxhDyfD8q
	dDWw8wNtlSpKQ92Uzv9nk0r3z9MVv2aG0u+QQmpRkGGMkQ0+QtBhe5z6xzbXfUhs
	EdP+4UBpmC7EZ0Kgoby1PXGDoCAwb7HYHnn7c+UoOQKTUP0SStKVus7eJONrCuio
	aNQ1cDNdIHbgY72gHy+K5toSIjCarm83+iMqRStFAtd3GtFXT4xmyfCNSB5Z6AHP
	TGH1wg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd4hke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 11:25:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21be5bb4so2653831cf.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 04:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782905144; x=1783509944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AulWVLyhCXJzuW3ldtc62yyZS4Q+nukpT7VtxUpyNkY=;
        b=URiIdti0ZqJJiv30m4r+eHR8Ev8ydKQd88qLLAxcX8xupu/QEvFSMgdeUEGrhFXZzQ
         jpmqsdgigsVFdcnpJqn5nVnvCd+EQsYpFMvITBwbLkbZDMBYELUqOXIii0LvmqTPjuiW
         XGJTVKwFLKBc74iqv6fA8Doqmt9v6XdOxlZYz/5uXThS60OJ0qbQ46ISSmnj8krCDfuG
         0nueseSrdCIvihcli3XFJ0xjS9ckCt521CU3xNioCamULVvnDFRl8AoDD+Wd0ZI7L/PD
         nLSbrUfRQ3k/rnpbdZgCNwnOB9/bF5c1TR+wsDbLGJFa56nXq39Lsn3bMNTynvGvOxyj
         5dxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782905144; x=1783509944;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AulWVLyhCXJzuW3ldtc62yyZS4Q+nukpT7VtxUpyNkY=;
        b=j+k6cXUAQYXe1t50gw0w7tw5N1SztwzVPkts0cssD9n63kO40P02XcUYqTTNHGrxbH
         cDb4LU6qg26ZPIWd3uT83wNYc32diKvr2aODZ/Ik2nZyoPI71j9GOjTtLKWh/IUNspou
         oxaeMGpmTeg5ZMfQI7fX4D5YIJ49di+ATteS8e8ps70QnpUJnfiZT2M9Y4MRxnTXpXY6
         U6tGbjX2ICcj4e2vKYNYGD6PBa46zbaq/nAx8x7p4/kZkvwbx6Brv8MTd9vtRB+F9Ecq
         yrC9ukKa4fMr4PzGkbYZdjS2rZ504gp1jsDaGxJ7WwfFxKefjfSuQOzwSs8oDkhMLRCO
         00wQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3L9ojdfGJHGbNlnpPtGeSs8Q4qiKQpk8LX2ljKg+Rz1JmB0tgpVBvBcc3RYFmzp39qdsrhgMVzcwn@vger.kernel.org
X-Gm-Message-State: AOJu0YwE1L8dMFDJbW4AM1/IS+vl1odW8qCikvkIsnUqx4oyQXIMclEd
	q57Gzc6kluOVLGrvW7HX87IpWeD4cyCsaaz4F+I4tDoCf9BbbFalgwN3XmXDLvbiK15aZlbPm70
	mH9XYmsbRKcprwFnemUpkdx9QJX4GR0DyUW7S4wi19AL/FtWZi4bakCQCHA3pH8YY
X-Gm-Gg: AfdE7cllR1uJBJ/OtlinaQGNErawVtIV+wFcvdGPQKf8Tfoq4yZZxHqNhAWAgnfamC/
	KZFr1jFzS8K5okkKHWAc1vKFiakT2JYMopYu9W1bZgl1I2Vm/Lqy2GHfiT7K3T3fn0/iS0rfY0x
	sePspCB1LyzL/Dh1tEYmPGSHoOU5UxYvSeyyuBQBnyauqVbwMVm+QaYXL39qd+YnMXGb1uRtIoI
	lGmxCY/eWm86bq4H+kLEkH1ksadOcDYIUAlVa+0R2WEIwjDAmu/w8ssC9Qu8/A8jDE8R1k1y34W
	gsgtlNaJ3gUO9ZlGAUnRF74t1FZr/Etepof9cCOv2ZNoFzZ8V9v1CWTfBLKl4BL83zMyDnnP2WX
	xHViWExfqYoEhIpZJ+ZneeFJLDd9BFEZyikQ=
X-Received: by 2002:ac8:5ad6:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51c26a45ba4mr10768651cf.2.1782905144330;
        Wed, 01 Jul 2026 04:25:44 -0700 (PDT)
X-Received: by 2002:ac8:5ad6:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51c26a45ba4mr10768301cf.2.1782905143868;
        Wed, 01 Jul 2026 04:25:43 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f4c19esm258210866b.51.2026.07.01.04.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:25:43 -0700 (PDT)
Message-ID: <ccb81ed4-e8f6-4e02-90e8-2433e59846f1@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:25:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] regulator: qcom_usb_vbus: add support for
 qcom,pm4125-vbus-reg
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
 <20260701-add_pm4125-vbus-reg-v2-2-6bac2bac7131@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701-add_pm4125-vbus-reg-v2-2-6bac2bac7131@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEyMCBTYWx0ZWRfX//DMFy/YiYkh
 WNyt05rJ1r2+zycldgErVFvc8dmJztjAfxzJlsSaIoVnOY1sVI9OI65AsxmyE0pscPxYhWqq2Cd
 4952U5pywlHSIbzLJFDcp5EFUbAQps8=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a44f939 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=eoxlGDcgPB-HuCwanXQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: s-LLdb9OzAKFYi7wKLGhsIeXZMl9y-tf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEyMCBTYWx0ZWRfX8QJSjBa+EG5F
 qSSGzCX4uMLMA+jqQ+mVEEZmGkMOVJPh7VSbs+vkyf9ZetfIemfRGz+xyB+4SR4gW8wC76Vy0rU
 SLDsNc2TXlpLlET+Bx0PWx7Ry25eFW/7d9s4mBz7BNWVVgaqVCN0M0THjV/yWiS1z8cVau6uOZh
 9Jq82XghKBZUNcvcY7GXLn5G20EbnIQgypsfRL/8TxPhhsNHZY7iX+E+GW/I5oZaxJWQ4570iYu
 L8V27WJBjTdzJUFkL2Y5aof1Yl86qpU46+tuaXYxejNtyKTZPPTH2FbPWx9KMH6gD5dxA97IHuv
 yJl6LL9mTXkszuYX+HiAnc1/aDPe9kSgXPtxH+8ulVgSLAMvcOqJn7HtfJ8leDhDqdMWsbl8JAx
 TymYvD4BOlu0mQ3YBkHNQKPmB8JjOHvTr29koM12d8dKhHCAF0U3RwbhNPrgvE5lZ0pitll29SV
 BKywiCJyFm1oPtrrjsQ==
X-Proofpoint-GUID: s-LLdb9OzAKFYi7wKLGhsIeXZMl9y-tf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010120

On 7/1/26 12:28 PM, Rakesh Kota wrote:
> The PM4125 PMIC uses a different register layout for USB VBUS control
> compared to PM8150B. On PM4125, CMD_OTG is at offset 0x50, OTG_CFG is
> at 0x56, and offset 0x52 is a 2-bit VBOOST voltage selector rather than
> a current-limit selector.
> 
> Introduce per-compatible regulator descriptor data to accommodate these
> differences. This keeps the existing PM8150B current-limit logic intact
> while adding a dedicated voltage-selector path for PM4125.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

