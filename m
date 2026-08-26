Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C753B7765
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787741120; cv=none; b=R7mEeCRqP4f7bZ268spbki/KeAQudoO4XcKiLHDzksEUNmTGPI74bLY2nDPl/sK2sE8GtXzp/BRxyKVLgJxKlSavPE7XOMKq5pIzh3dza2YpNOt9ajd4eXC0yoCtzr7YoCKhmcl1566XR8Wf1OBy1QXcINsNBT2nD5CI6Mc7X4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787741120; c=relaxed/simple;
	bh=hYhdNw+xBDckePJH1bivK1EXjvy4kvZXDMpqsnfJzqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PUDLzTlM67CxZjNnd/WkWUXEe69/A9qYu653GUH9uk1BYGjXePoCeaSMP9gtI65T/h9h5CE4iDczN/NO8V9QhK9GbQ8B6Y8fJE/g7ixlLEVvultVNIP1A2L66Wk99T6MnMkH/IqooyuJR5e9B+KjAV+xfYKZ/MbNB99ojPINlTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDg2SUyL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MlzTBnzo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDg2SUyL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MlzTBnzo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAHrVS3649651
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cOsapntm4VaLWqb5Qj3GnsvGzm+rBmPLVb235iEtbo4=; b=PDg2SUyLycn43ZmG
	0vnAZXz+m2gxezToDjRxhb9t0sHSjJnVSVIDc0TNhhBJkJp3ZA5/mv8CeN1z0hbB
	hZpar3GPUCMvE9iDJcOVAftIhMoZFfbQFNhUbBHdcphXq6WR9Co/z8FrtSDjmsOB
	rZyF3giwLSh+ulOSPY+oKXB0UNMFLUso1jWBaJlCzKvHpkK+rNpQzCMqbjZFXMg/
	BJt/Jh7GIK/+E7LNv8yusuoDVxl25VYmBL94oR1LBgFLbUVW2Qj0ddLvrPrgJmBz
	N/ZHcdXT/VapnAy1drE33H8HZDFk0u5SdhAQq4rHyB+ZmKB6zjx5wy67kIhaDrdl
	oAdQUQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthrr8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:45:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so6075941cf.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 03:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787741115; x=1788345915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cOsapntm4VaLWqb5Qj3GnsvGzm+rBmPLVb235iEtbo4=;
        b=MlzTBnzoyzbuIcp0behRsriC/YtNdf3Tgh4ZmWgbmyVTaTiBEqGIlW2uTF3cR9I41F
         UP9ODWkUBp3xNmJoFH83NN7d/z1jtHBcNaI/WaHGTfcOQ5wqURJEefBrUhtR8haUt9GE
         KDPIGADcYv3sVwSPXKhccev5Vo8tOUkeelqexComOAVevmQDY4ayvL2QdAZGeijINdPd
         4tDrPDjfQMpDIflvZsJ6EgC5F+ybxgSa0j+DphnFDjmMPYdaam479X7H/VyqcNcqcXYE
         9pdUYcvJxG68Wv/8A7eIfJcTXy0IdIy6jE+lal+kZi5WRHJ2l0ym1xFCYSADBXIwKOK3
         VupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787741115; x=1788345915;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cOsapntm4VaLWqb5Qj3GnsvGzm+rBmPLVb235iEtbo4=;
        b=L9esABp3bZkZ8qdQDJwYqtwIH/msfVygec91xSAVbj+LPKAQevxKMvgNMoKExvsF6u
         MOQ35r2Fy0Wcn4XIRyppEaCgV03KMFt4JzjkbXVwHOh9mSuHhJ6Ei9xYY8zqF/Nqh+AJ
         SdVWu32+PhwYOH7oZ6yXZIvqKt2adAj4aQZiSkuRqBF0wJ0vDoEVJ6SQ9YDQ3AyzDFu6
         TrfmUfCwP0ARy+1uUrxuroswBbidI0u5MrFAq982YWa06fReWBTGSiG+dr2uibRCDH92
         DaS8sJKMyaZi0/hngVP5kn1Bq86Zh4haJFVYqpVxcQ3fAqbQ5Q7/nFAv9l/Ac0uFVOTQ
         NBhQ==
X-Gm-Message-State: AFuF++lAMo6gJ4uGc7BPmjYg0Mshxa1FXaFYobAnVZ/HYo7VKR8B+e99
	4xgL97iDhHJG993lMTKIpLsbzmDLyaHRPJtaGpmuJ/ucAb+TzC4Yy3RwzwUMg+suKrEyhS4QTgr
	ICmb3HxnOq6UzHM5Jir7BA2ScX/6m1JM0dntRCyWNIyWRXurSMhsrrQt7/5fm1/jO6Acroykd
X-Gm-Gg: AR+sD106H/qxw+PlHmN2vjhEMKwsk2hvrhxwlEAfJZ6sQMjM7krWDZ9iIti62PSdET0
	wViNuyKbwSwEw8a9lOmEt0eEocIuG+6pY2M5wME/VwQxuDoJeUU6H95wtmV4Z0tpweCaaTCXZrU
	dl8XGOAlFyEDY/6YD9Ed7qxnVo1/HoyKy7iDx0gljPkarqpnhgPDbDTWlMa4mO3H5ieJpd4uQwV
	SR1ewqT/9Xk6U16LGgj2xqsFFt/DpE0ERGpV9olNYT8pfSupEmN1nhpbrrQoYh5DwBMFhlyi42Z
	LLPziTFL5t2GWEn45rWo/lS6ceA2PONCm424m6CAqnxVu8+TczP6MLDOkiK1NJZ0Af+ZLZ92XRm
	kwfcQEduthBR9yFaNAekYXyE0hrPt
X-Received: by 2002:a05:622a:1aa4:b0:528:3d62:16c8 with SMTP id d75a77b69052e-52e4236c9abmr50401031cf.31.1787741115413;
        Wed, 26 Aug 2026 03:45:15 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa4:b0:528:3d62:16c8 with SMTP id d75a77b69052e-52e4236c9abmr50400461cf.31.1787741114889;
        Wed, 26 Aug 2026 03:45:14 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8d1afcsm5312421a12.8.2026.08.26.03.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 03:45:14 -0700 (PDT)
Message-ID: <a8747b70-dce0-4a7f-bcea-6121d6b5168f@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 12:45:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/10] dtc: dt-check-style: Call
 _strip_strings_and_comments() only once
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
 <20260826-n-dts-style-checker-continued-v5-7-fdd16ca6e771@oss.qualcomm.com>
 <20260826103158.D89201F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260826103158.D89201F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8ec3bb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=0WPWf5VlfcFsqQEkId8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: b6o1c6Ap0a2uS5888PS7jED9_DP6J57Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4OSBTYWx0ZWRfX5qqlFBIdKzo7
 HYnPPukoTipZNkdGy7oz5vUhBPoT5FMEONRhvirsbTORH6GwZ1aFmU+cAxHTH9l77ANbF2B8U3q
 WcfGz0mMmGlxJ3ov+8xJaGTf2WD874D9TTTm4D5bVSWGp7WlYbpbaurF49Z9CCTMipp5rhNR8AZ
 z25up9D1pBYDGD1iXNSP+a7pHd0+DmL2In9uxNoTvjMvrZV98QnwPLWK32PVV935TOkO6io76c7
 +tq8KFvc151BeUjByRJ6zJvDPl+Y5nDqkyKwSEiVca0aXQwlWU5J+wunK6SpZ1WbuXNNUGTFX+u
 3gj5RsIz9CYuNkHvExX3pJU4Qu8sjk5dATbew2o+uAr6nOIajKCQLi8MbJ0gNOuMw1fwHacFpe1
 XgpdFchuzUjvnwsULvdluY9KKNhfOS0sRxNWeBrAxIPnRfnLLH2Pblsu6eZvwOtwIYXMgrpi8WB
 xCsJUQc/iDjKk/+dh3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4OSBTYWx0ZWRfX+G2fA+vpgTXs
 qXOz4EgEnYZt5CfjqgGH8OYZy+Y70eWtvk/fmyNCKXwFSo7GokELIEEJf10FMkY42sInYuY9m3L
 R/b0sApMdLFeFVWWEL6NTHoyrUXG2OM=
X-Proofpoint-GUID: b6o1c6Ap0a2uS5888PS7jED9_DP6J57Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260089

On 26/08/2026 12:31, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Removal of `.strip()` in check_value_whitespace introduces false positive warnings for extra whitespace.
> --
> 

No practical impact found, but correct comment.

Best regards,
Krzysztof
