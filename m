Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E313DCD87
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176541; cv=none; b=X42RtZtEXrZbyxG8aGOETXfYMQ6Jb/qr2KxDvzy7AuGfJ5ZM4b6PM+KKlc6E9W9SzDzatERITWRYxjfkW/N6kvqfZVvK2hWZ2BGl7jybaiDMrom6Igju4Ki6I77aiXP1jvzncG34zQsBS4rtika6VM9I+2rqv46UAmMnuVQ+ITQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176541; c=relaxed/simple;
	bh=laIREpsEBUXAPtTWdF7hMAJjEruMpnAQd2quvID9OoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gZ6zvI/ViePJc2Xbx2zc0QcNtPacqKbHWz7tSynsP/uo76qtAeUEsluHMSe5CnzD6ZZvnHF+zekZoICHeTG3szge3D2P1T8e4ChoKqbPTrq4aF/LkBTZI4Q9L/7fzmlH6VpOSInHTZbQ+HKBgWNqycceWtNRDvM+s8OUj/L9hkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jnFP6fbn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YO47Pe+Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jnFP6fbn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YO47Pe+Z"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xRWB174136
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5OCxphMzkt3Qxu9Ul81ai1QpDJoc03uf0INUKFrkEXs=; b=jnFP6fbnq/DOZqoj
	hUHohOcZ4dh/W1azTTALWMCBmmtIm15E6O0qiF3BkbIuIfCXnZ1v8tvW9qRvNx91
	QxNNbJXUVNXWO8BaK+c9chhUNgHoN9nD47B9eTr61hR4KztwO+spLVo6j0w5AqiZ
	lNwZnGHYhs7RTHfoL8IDzSm7pFUhEABw8ISIwOfJ7tw/k3wFLIdmD6C72vEOICVj
	aVikPQW07lZx9uT9CwA8U9QKUNPQSwat54GUtupfY65fbCVUqNfg28owqS9y6M80
	HS2eVrffVyH23w1wnxjdq2qD1l7nWRCXXyd8UVSts6Uvl3JNLLDWCg1qHBgB5GhO
	IK30eQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6vb209-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:15:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51759082206so23322441cf.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781176537; x=1781781337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5OCxphMzkt3Qxu9Ul81ai1QpDJoc03uf0INUKFrkEXs=;
        b=YO47Pe+ZbvLi3ezLsRDWTFT9pjnxArmJFtxveaiY2PgcmU4TSfVEeqgtr2fgni5H/C
         ynDuEmhHwAzvr0O7vUvWLhK66Z5HpHR3R885R6mNGuxb736s+pKo1GznmJwBNtsrONh9
         hwgXOcUKxFPbOwPJQXoHp9wYaHdBmnPI3c4R8+UWVnHDCmmQs313fcrS3fDUJ67232BJ
         8SDeAB+J0ozFYwRmndgiRExAKVB02QTbWM4EOVCgBipN6pbaIz2Xn/lN6UsRbApCtrrQ
         V27IrmDnInIfFbzniJcjJavpUOgaLr5fKMOiOZLptYEV4W8+sIP+/Hr2+Au/8wFcVNhp
         BlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176537; x=1781781337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OCxphMzkt3Qxu9Ul81ai1QpDJoc03uf0INUKFrkEXs=;
        b=SwTPqsaO/3EktKEJ3L10YnVe/fIIGifQa3gce0B3myMxebwdRS1QopbNp8FtUDZWz9
         VPNSXMohcWVk62+1RI2h1BtIuZdZDsYKKjaq2+NTmD6SrkWkM1rZRi/9CdqufQJdorIW
         z0Aau2YKrUwNq5D9a8Npex0AiDmyL57Y5GK6WP+1eIm6ANyKTKGsJlKODzPnkqC4uYOb
         Ge+lRacRi/HW1TZZERagz0n+hcrwRrhnS0X3+Avg4dtqw18+0cMKKpZyxVT0k8PhFGPc
         AFJan7lseCYuFeb07UcfoU8OLmqkIgTAb4CUOE+wpNMvXi6vaDGpiDMFZHwo7Arfy9uD
         GVhw==
X-Forwarded-Encrypted: i=1; AFNElJ+KIt86MkikMrz+yAOmauSLVgG++iGKfJFzs6jkLuYYYjqjZQV3oUHMIoriTunZux1dhHKk8NWKKCsw@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfgq4CPVscWsx0lRH/p5q2UcXizADoPMSw6m8HOMzlXjEShidk
	V4+hqnRKs7uwMXNTCOtpRD81R/R72+4Yxf+PoBhuKA60/p30W7OO0WfXr3b1An9l6H3mGEj6/yC
	uZTmokIxZiqKJfER8xU06e66uksi5dUKaGHgQD81mffsUrz+zhH2nhLt7e+9c+ZhT
X-Gm-Gg: Acq92OG5bHJIkJtzt0z9xsHyM3oosVcAbTUsEfvqkiyULLJIyvIDrGt6XHtqPTuWxnY
	6I5yQAvF5qZbaF8GrJmn6WO/4HeehvY45nao1QrBlgq2UvaSVOXDXiFsSO07SkQc0Lwr0z11u0L
	EvJymVVaK8t0FEqxZOgtLvhPdNlgzXFoyh4jKJmt5TT3yOMXp/6aZX3ND34S0Chb405cQk5Al78
	nEJR3MJEIpJFd+6J2Y+7IJtWPVSHI8CaZpvTWZ+orE7o04cjFYW0+omTrmIVNB7FjkUSZkhpIz3
	HncCtRs/dRqJ8rHMmzi9VnU9OXLpK0HwtAoHe0bprkMFRF1trnHmPQ35SWk9vk0mZa9c6EZBFN3
	KdL8UbvtHLFWg/plWykzCyNRGgpw69srt1R2VSCgYV4BuGg9pQa14cXZp
X-Received: by 2002:a05:622a:c2:b0:517:5e32:f3ac with SMTP id d75a77b69052e-517ed683227mr22907231cf.0.1781176537533;
        Thu, 11 Jun 2026 04:15:37 -0700 (PDT)
X-Received: by 2002:a05:622a:c2:b0:517:5e32:f3ac with SMTP id d75a77b69052e-517ed683227mr22906851cf.0.1781176536808;
        Thu, 11 Jun 2026 04:15:36 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6912faea64dsm6985810a12.19.2026.06.11.04.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:15:35 -0700 (PDT)
Message-ID: <72dc1255-a1cb-476a-bff9-a49d960e0277@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:15:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] clk: qcom: Add Global clock controller support on
 Qualcomm Shikra SoC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
 <20260608-shikra-gcc-rpmcc-clks-v5-4-94cefe092ee3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-gcc-rpmcc-clks-v5-4-94cefe092ee3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DphEv1nzQrQnC7739r4H-A6HL6dqEHn0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMyBTYWx0ZWRfX0hTjRred3asL
 EFmq50J2Q9EHYjlut6xdlcFgDRkEuKrFEk7qqt32hNgMKjpB5JXwD2EfMiUVJF6rVQf27UwCGW5
 ZV48ruXOHiSQeJb70byhvXHI+Bv9MM8=
X-Proofpoint-GUID: DphEv1nzQrQnC7739r4H-A6HL6dqEHn0
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2a98da cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IyfWUWnWmjsiacPjz4MA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMyBTYWx0ZWRfX58V5Sn7xfj1q
 pjM4D8uxIbmIeGmf1jZicFhxRiYCsAOl1RJ02ppHwF3v3ox9OjFE5Ov38hjXLlSj0g4cI/UBgGw
 DBvsdQzW28V6lutF5OfDAC24dTrYZOQVOKdDJKvJXDr+04zsbaR8o10eoHRHfIJePgUAPRDRBTw
 jzHej8F4ALxSgodsjbZRcHRJWn/JTyihrLDo6GqtoTgATcyj7FZsZDbUMkz7mKRqu/8c+8wQLoH
 ZcOXHU7WGMfKqmKRBI40omG0qP8aykD1hfSOjGa/Rc3BmqsD2EccYnfMYw4vKf5SygAKuLMZuWA
 9WHD4RdqJJxAPxJKevqCxYmHF+aPEDxXxn5fnBnEtoi0zeSzP8J3SLWMBqrWCjVfNyFryj6xyh0
 yuned/eaMeWPK6ImtNVzbxeazHqFq/80ls9PV+01geBnHeIxFPwGhZY10VZI3OAfN3K6nMSxP6q
 IuxG0n8hALJ0AfKH1Hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110113

On 6/8/26 2:21 PM, Imran Shaik wrote:
> Add support for Global clock controller (GCC) on Qualcomm Shikra SoC.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
