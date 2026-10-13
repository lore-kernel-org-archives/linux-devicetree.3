Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D57F39E6C9
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881445; cv=none; b=bM4OY1xBYU44ZgwaE8ZOh5Q7aTT+zfAifu4h5ztybyDl5fAwSHj6c5MLh3HjIIPIpfE4psaA0bVFOwVQUY+FCxj3eOvD43OgVAp+c+lBo3lucdb5UytU91+h7JsM3YKV0hAvTBzrmrN0kALJAmN2mwvYMPcc7Mtmoa8Zj+Ob5zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881445; c=relaxed/simple;
	bh=rrsiypGh0+gRn6w3CWCp3ePyqfW44mmQknjAly7nC5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2GCzLjo5d68wWtzIDDuxttfn1Bo8qN+gHaFL9cN705yBnYq+szLYyzbpvin154QPrkw0p3aLRRf6TjvjCsyPGROdI5cv0rLnvWrRMzrgwP7rWu9pfSphlXyVwnn5+cBRUui6Hp0FNBfLqOLLAOprDhkKb82oJjHw6ieWxnFNN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iIj4RWeT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=asudoHAc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iIj4RWeT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="asudoHAc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8Zjxq3054783
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XlN+IOV4cTreUmbElrbiU6XHdrsCIyblNEqpVHZhJMw=; b=iIj4RWeTko9Z9QnC
	YzjnKJocE9i4x8nXCIQzeeRxl5s/7iz4xAfsYDrheXUYWOmA8mIgx4rEJCZ90M7u
	VRU6gjdwZ3NWz6v7ehJUxoH231ozL32mOx3KFmajAy5Xta+EkcukXv+KjRUTwJ6C
	hZHy9R/7tria0QW+STmCFtqQU/SXBAbD3N7YTHDVLg1jRRX+nWkAgLSvFHoDMuNj
	HS0M7reD2DPpc8EfXy8eDlfWe+wRqbJj9pWsY3FCgrzB7/4PZiameJ2qoLqzMJ63
	O6FQu4cnB9r/b3zYi7PZmTKta0jN9DtydcSsAUgBhLtiSD+CnLfkV1NqnfB2ogjh
	xK/cyg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeuc8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:50:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e46c120dfso281061685a.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 01:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881443; x=1792486243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XlN+IOV4cTreUmbElrbiU6XHdrsCIyblNEqpVHZhJMw=;
        b=asudoHAcm3h1Vrp4nXvMag85PT4aJc+fnDtgCFiOtT7q+Rm1k8rvBd7z5aROATpOjJ
         SzS+gt22SBGeNme+JcSj9iSTawuR230DxCF5owfhHrkPWUfcGfJS8szBcLzNKTMxZbIw
         pMZZlEvHnRDgg7pEat6AKBpzEqWE/k2XTZFLvQSuIhVNn9CAvngP1G8kw3uku4VXEa/i
         mXV3nYgnWUSQugQ4w7B/P745r7CrPA41/O9FrisXml2Cac9WnhGM6n7fmVDieSq5xCH/
         aHAL8e/eH62O3dK24r8XIUkjlDZT5jWi2hLVSv0AR80YE1Mlo9qMUA0qRFrnlbNia5nB
         PIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881443; x=1792486243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XlN+IOV4cTreUmbElrbiU6XHdrsCIyblNEqpVHZhJMw=;
        b=IT91f0k6FIFZw2FuWcTXjc/4KW2i3G81qKUJd00C64SCDcnoiVp7wjSUAfq1avq293
         gPD4oz0Fv03Anf/JpjmvE3grr2ZY2PQoHrbRWwJv7Z7kY4fUOBTtVWPvC2qgtIX/Bl93
         WvJShbOvcWzAzhME/P8//jPKpRe7WoS1bNKmVHddkCeHT6hoVoTLlOkcJAbDFKKZ0v7P
         zWV43c0E6CPKMJVHfPupRPfwMq1Z7V9mHUUjdrNlQSgyM7TFZtHII8njSFGrc6D9J1jD
         arlMprB2TriOKP+z/AotH6vpIm6ZUysv34HAPcfADGAIszP/Y4jPaXd0y4R+YW7KRKSA
         NZ9A==
X-Forwarded-Encrypted: i=1; AKwUvBy7yFcQ8jXvSB2GZbBGRLBsc0ZDg7RISUJ/fHMiWG4Igo/pkdgPNUz0k0NnNZDYCEllZi1NiA/0LeP9@vger.kernel.org
X-Gm-Message-State: AFq9FYLprAsn08D+EIp2ZuW80lDiASrKijRkTpdYSlx5dHa+N/cfaZuW
	ShSymHFo3yruqh07NwPLtU/wUmOJqt/8+awf6BtSLhImbFlExStgFrYQcr3dWGiEd2HdhKqZohm
	yldCWcTqYZMU7ZD6cqrlqCBWB4rI84SeU3nxJsTOb0ab60V0akpinfU2xJWUmuK44
X-Gm-Gg: AYBFou2AM4M+VfWYovl7W74cJ8eZbQ59avLKwFupCaNYlC+DBvP5pw8LiLEq5x+yAMX
	0YTciBdRn/X5gR0Wjd9OUGSilzTBSjeY0nmRSHDqP33Z1TjIoLyh2yxf9zKXOxDc0+O7LHQtK4J
	coFdAU6aIXNd7SBJHkKC3GQ9ypP9wv6hR6GjMnHx8t5DJ1GQvTvi0aMAHyIpx8x0jamyWWCbW76
	jZ9LzD1rtmjK8oczZKcASFY+g+cfuCw68u4GMCP3t+0+RhQHRYhCg165YDFxyC8DEDYADObcbZI
	wZk14CiQZKoTVRDE1Tk3Wp2232G893IN/V3AchuMCDzYMsTJzjoiO84DGxtGcTrzhu3WLEy5DCv
	1YMJKLufRs0EQ/eJncV3XqQjiU57/rKdjwDGAfMnWm8PBvWBGNMeAqni34qjMtg==
X-Received: by 2002:a05:620a:400b:b0:93e:c12c:fbca with SMTP id af79cd13be357-93ec12d06bamr1573657885a.70.1791881442710;
        Tue, 13 Oct 2026 01:50:42 -0700 (PDT)
X-Received: by 2002:a05:620a:400b:b0:93e:c12c:fbca with SMTP id af79cd13be357-93ec12d06bamr1573655185a.70.1791881442030;
        Tue, 13 Oct 2026 01:50:42 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2e0dbsm370949065e9.11.2026.10.13.01.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:50:41 -0700 (PDT)
Message-ID: <196b51ef-835e-477f-a46e-575e37bb17e0@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:50:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/8] thermal/drivers/loongson2: Use bitfields and
 per-SoC thermal ops
To: Binbin Zhou <zhoubinbin@loongson.cn>,
        Binbin Zhou
 <zhoubb.aaron@gmail.com>,
        Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
        zhanghongchen <zhanghongchen@loongson.cn>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
        loongarch@lists.linux.dev, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <cover.1791512067.git.zhoubinbin@loongson.cn>
 <1375bd12403bffc496261953772a45833f9b5a3e.1791512067.git.zhoubinbin@loongson.cn>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <1375bd12403bffc496261953772a45833f9b5a3e.1791512067.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6ygqiNRheSz3AqQexgALMk9_WcN8xbsO
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6acdf0e3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=ua90ykTK0mPAOTE1wUAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfX+X5bY9KsKJLC
 tqCI2uk22FKn12w5XnkTOk0HjiFSZoBL32FCMIiybHLk0Xrd2gpb6RFdpNC+AlI4w/bTgKC/G21
 V4xyYdm/Lc4vyI5EJmvk2/EoDvauhyw=
X-Proofpoint-ORIG-GUID: 6ygqiNRheSz3AqQexgALMk9_WcN8xbsO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfX8sB0Q9KqcuN8
 OTK+fqENKtucG0rUC/e7a+kqBrNufIZqofMShAmdujN5ry7MDVNMUgUM2aNCDuLMrT3vwWQYaMf
 vl8mmVozT/23B1BPPZ6U7BO7XU7F4De1FHfpa0QjGshyCSF6+wdISH3q/nW/CP+mXJFuElKXeeE
 JMa9K0d/SrEDphp2s2+Htlt8StmX6+1hEcK+pI6JDafxxrF/KQeUnig71z0kOeUTonqzog6xpv7
 uL+a+LBcrQdMRjkUYbbmvZRZuE9KIgG/fr5Ci+G4mfHDZl2DlhVSrR/Bv3prW6qBrqHWo/a7Fxx
 fJ1Tz8yVj069Y48pVMuXy0L46g3QqRZik2tiJEc+U33nls4gnIxKZ9F1EADyRncguglgxNF/Q+6
 oO8fULfpJkebY639D6wj2SdpVAo7aUsYZwA3mYsEX8vsoKOkuLWzp1veytbL5dMvpKVUMjUVnJB
 INz1An6QRIBkItOOWTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130035

On 10/9/26 04:58, Binbin Zhou wrote:
> Replace open-coded masks and shifts with GENMASK()/FIELD_* helpers, and
> define named constants for the Loongson-2K2000 temperature conversion
> and trip gate calculations.
> 
> Split the temperature read and thermal zone ops into Loongson-2K1000 and
> Loongson-2K2000 variants, and keep the chip-specific trip register
> callback in the chip data. This prepares the driver for further SoC
> support.
> 
> No functional change intended.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---

Please use the bitfield directly in the previous patch


