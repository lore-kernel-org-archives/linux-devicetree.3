Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C457A3B52FF
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 16:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354172; cv=none; b=K3Amwr7V+bKnY4LAV55EQhmEpJMDG6DtkSKbFidmO6Gn53e5d9vNlSgCK+f9qJ45m3y9lYTSgsSM/jpk17/xTzcMGCwNl5IOfEJIq8ru7qaulxRFDYi39vJvYohSJyoLMtHq6imI2IsfzFhYAdLLgeMLDT/ttY2NsYSYtinToSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354172; c=relaxed/simple;
	bh=H2tdUNFpzn/6ESWBcmSnoi7TGh31VsVyBN+/LBxJM5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N3Q+GOl5mrruAzYU4Nh1T8Y2ZR1wXER1uOIh0tUuV3ubxa0AmNRL3kdzRatzv2uZj/dNmBakFL4u49S32U/asX06y+4uNWQdINdijakeLJPSl3C+Shkl59IUkDfevbDPBNqSg8BoVb6ryfMhVlYQPcMa/Z/f6W1KvYi0a3MiV5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5out/2d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Etw9ZDI2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5out/2d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Etw9ZDI2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFHNi958770
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 16:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H2tdUNFpzn/6ESWBcmSnoi7TGh31VsVyBN+/LBxJM5s=; b=O5out/2d24k2qMay
	wDHql2FmREAamhZVzZjgx/AD6jqzbBZRB3qPKMIoTFEyx3IIrRWfphkyuwVA6cFY
	nBud8K585JLnHP+xJRPzvhqmJl4BY1T+vmexxBebtr7uMmw9RI1DaRtV+1iBTu7i
	Qm2e6yqVVOds4Sy6KWpm0K8+Oc4WT6bpYf8N2THghH5qdIOBvYMXP/4ktVL+ia2X
	wFR704UYp/X8mq1Kilm1KP/tNWa9Ccur75QFa8r0FJilBAUNiYpSFG2vYE/wPubX
	5Y8rpS1QdSyvn/+F0hRAZYvhx9aky9QaLO27DEsws5xd5VbH4m9P+Sc8EAPokDVY
	DilxeQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9a721-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 16:09:29 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-59ec1fcd5aaso4295425e0c.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783354169; x=1783958969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2tdUNFpzn/6ESWBcmSnoi7TGh31VsVyBN+/LBxJM5s=;
        b=Etw9ZDI2DxBn/RLHHrc37Z4cjxNQ5Ck3eqaVx0NnyKOxO6aoKMQxktSiKHDEpOsimp
         7FK6+kGu/HjNwQH5kQHGfWGTikTAurxHmsQzN7/SpJB9/vFotZ9X7SGtQ7D34Hkaw7NW
         EpXZFaxLbfPJX2xdU9Q7JfJqUOyxLQQNz6CIsFvRWNDrTUdRGrCfTz15RDeUOUSF0dGv
         Iol4cUFf+AOHIyf9u0RgEp6vRc/4q95WMbXOK4c8mJF0w0Gi3FtqHVHYKqcSN/omwWG2
         V+Fhv+fRxOhsKxsgvx/uIjuEtilNdei8xN5HhuLUKAf8xiIcGweR16X2Rvb5RLxYCyTP
         bSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783354169; x=1783958969;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2tdUNFpzn/6ESWBcmSnoi7TGh31VsVyBN+/LBxJM5s=;
        b=nbGfMHj7+JfRZ5K9JFtWDzKkuHoZ1UUSJuUjkVfSgtU6tH9YCM28/r5/j50DPoQN7k
         bY+3Ahjz0VoYl9G44HCm/6NE+ESD3OMVWAy1Gw6Sc4bdG/3uxUyik7jRDJDTVI4RivLI
         bBlo9DQjtwvzaqWmcBNCScCd0NLPT7EdYBy71gY94NFf6EmlXzl1b8y+cSt6KEX42HxT
         CBHazKhpVQPDq/j4xiRx/hDrj4PCZ6Il9KxGMPVrNv9ULwUJDu9XgJUwKzWvwGuFOJqo
         LdCwCCPmObe/UZkR/beRQFhSNdme8asyIcP+EfWtRYUouDo4IYcpP8noSfXuafMyy7GR
         qxlQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro56P0FbMaTBy8NG5L2hW4gitn1SQOPJDCiz78ALrUy+zDVogljwqT9ioD02ZvFQAxWtQsl79zIsLtE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+7DupQF5seZBPgNfSZ2CGH7fb+qShuN6R1HWxKzlzIT7zHCC4
	f5/aTL7vLJQgawLQ7847pGGzF4FyjEEe8bLNVOebrF8cdUNmYAjKMZTNOSSGPvUz/Hxa1JXztSM
	JAiczECu4dj2kQvag5+Hyqe+HH2wXo7Gkh+4nH0Aw7EnOdEZVshBojaF3cD4iHnS2
X-Gm-Gg: AfdE7cnIovePd45guxvsg3a/t3X4xc9ih4RBmuK1iDEkC5c53Fl0EJlnzoYSf3IdWYI
	97vncxZgIKVi4p7Tm8gqXKncFW98U3T90g4PgVIZ6N37Lqm4ZVM3KFHzh6XhqJd4+NJqEXUUY0w
	qNShG1hKDrLogW3+KWM3MUVx0dqgIXjHmH95N3sTrj+cmVHXKnB+514r7kcvbGbPjGmQmZJASEW
	Taj8y19lGOsuoLoO0cKEF5s9XsvHDaU0Xx9Y9h2QBApkwN23FZDAJLyGmAJKJlWDs0M/gLXKXpO
	bmdy7+Y452mZ8rUAEUtl9fjngq0hsvGUJfMDpid5Vxi2nHGURrikQAQRZzr2SlgWUvefMieKjX8
	pHLH9adYYq6pafuaCiSNeQHfLRV9w9iOGemryNU+p
X-Received: by 2002:a05:6122:4f86:b0:5bd:fc23:c9d1 with SMTP id 71dfb90a1353d-5be9074fe2fmr746916e0c.6.1783354169155;
        Mon, 06 Jul 2026 09:09:29 -0700 (PDT)
X-Received: by 2002:a05:6122:4f86:b0:5bd:fc23:c9d1 with SMTP id 71dfb90a1353d-5be9074fe2fmr746881e0c.6.1783354168751;
        Mon, 06 Jul 2026 09:09:28 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa09608d4sm26808465f8f.25.2026.07.06.09.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 09:09:27 -0700 (PDT)
Message-ID: <697f8c98-1ad7-4669-a19a-875acd1cb94a@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 18:09:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] dtc: dt-check-style: Expect first device_type
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
 <20260706-dts-style-checker-v3-4-03ffacff9226@oss.qualcomm.com>
 <20260706160725.07FD11F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260706160725.07FD11F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ftQnGGGWdOEYatEtyyjhEkilQJaf0J6X
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2NCBTYWx0ZWRfX5AubgjzzttAh
 tB6weNVBUr1hBFYTxjrU9s99AFuUlhbOW8WoZqxIQUpph0dLyl8TlerMVrvdQoaQgtZ1loi5h/c
 8FYNa579Ll/ImVURKgQfSPVTJn6jQCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2NCBTYWx0ZWRfX7l/xx2ufi9tq
 hjXCwT/3uZ6MyGLc5qBRpjZHB/epjxNW0vEqw3CyMdrocZb1wSxxJKk5lQHITmWEEGZfh+SNL8j
 uLlmZNJoJNCgYaqnrX1PYb6Oi/WWBozEiUEn3UPKjhq+qZORrHznyAkl2S/HkOymUs+d/O+xfsZ
 /NC8MUO59VrDe3zOaFO+4OTYQXMveQVBdGoCAybQYV1bwHGpy498NusKsR1hvD6Q1KTVY8Ql7U7
 BMrDto9+YR5RCfvtnKTqjrG1OpgmSP0PurqmouAssevyuZv5ZZ3C/gB2rj4HYIx06AJ4ZsSfFbO
 ynjIdnUKOShp++x0Onk7s8kRPRZQl3Jx2fkrcGRVIL4hXL+rNo0S7jk+N4mtJr98D1fSP2RCkox
 xLeBn3uuZ+auRDLhxvpkasL7EhQAIDSPVl0IlJ9CUZld1UGwDz9TQXPUHwccQ23ndLp3yzIXQEP
 WGFLiKshqz1cUEcgjPg==
X-Proofpoint-GUID: ftQnGGGWdOEYatEtyyjhEkilQJaf0J6X
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4bd339 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=zlX9MPiCl0rqbHuUTTgA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060164

On 06/07/2026 18:07, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Docstrings in `dt-check-style` were not fully updated to reflect the new `device_type` canonical order.
> --

False positive

Best regards,
Krzysztof
