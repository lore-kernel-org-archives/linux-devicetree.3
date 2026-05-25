Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95B6383321
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713735; cv=none; b=EroyW6KlP+EwkxDkNAsjPLL2Dd51JjJ0ivbh/DSz82treRROJoyYQ6MiKxreufwqgHD2QLwM4xGFLahnReg7mIlQvDR4bJKhNNCmgGYpXZ2L44lgm8M1Kv7hMGGD80l/IMDkA21cPY8lua2fd8HuLmwgVU1hz64xPBZBvX7O48s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713735; c=relaxed/simple;
	bh=QQvYXgQZ79JLNJp7VZ55ftJDAMYX1KQCsL1m6ngHEyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qh9zRRI5a6snre4eXJt/gIgLrMIjRadXLPM9Ew0pUFyu4u56d9l2DLV8EbDayRYnwkiX9BtR0ts7qG/S4rq4LtVlv3jkLkYyFcWxzd5/MH1Q7yreluLIhk/SN9bN91wh79K551GUeTzBpx3iGKf6ju/CqsmjZzScIebD7JgI2AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+ZlAkV9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QGtU4FIC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+ZlAkV9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QGtU4FIC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7Qh9I3063969
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tNpASxgRfAk7e1AwXGXiG0LyhF1sC7Z8HgJNbKxjysw=; b=k+ZlAkV93y7QjTmq
	31m8q9bC/i9XmeB238hc/RckBBjaaH74Dsu1vE0hOd/7x4PinREo3lW7wlr8vKhJ
	5kwTe6Kbw+N4XahID2kuO4NmzehJmzVnOOdng6biu89t/xLqxJBajN1DtFjG79jS
	hVhIw4tFa0h6QKTJFfzM8L51RATLX8xQlRNgK2BYOHRp2NchJaYHFmqMnMiE3u29
	ad1MdSkw0eWd/HXbll2s0xFekZWbTT1D1nmWybBCd0Q4peYNtDMm0o/Umzd3lzKF
	t3dmWRBT+cGaCajwCd3xT7+mN2mRpSsI93MVcOgxBtXgtss38sl1zjANDfbmQWbe
	4xZLTA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecj1gh4xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:55:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb98b09d3so31800901cf.2
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 05:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779713732; x=1780318532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tNpASxgRfAk7e1AwXGXiG0LyhF1sC7Z8HgJNbKxjysw=;
        b=QGtU4FIC+YujCVF0Kj8thTeO0HyJOqWYJKD5IZn8aRVLrGTZEqu9cSt4QPQu9mzxxa
         UYgHa1RTsOzd4AFXEIP2TgEgR0OEoz2hmZ2/l+suLYKjj5VYG/XNVCB8rSrvsgnKG6ii
         qEOUK0mfxwVO9leyzh8DAhxtzLZSwm+6O+WcuYmeDYOoQNi7cA1NAmFFHFWt6+ymu9BL
         ontm/rrzwjJ/DvGoZduZ4bmA2Z8Vfx3d8c/UzmsMvNzjS4173ybuAbdB/ssmymw+T8JE
         vFf8a44PhIeojdvRPcw9dPxcUqtNkEkPHOQvgTmRN1IcH+998WKW+4aM694sPdi8Wc8W
         aEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779713732; x=1780318532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNpASxgRfAk7e1AwXGXiG0LyhF1sC7Z8HgJNbKxjysw=;
        b=L0+pRuawfjc/G177EKk/pMxd2k+8F0eLFzmR6gocz02xDVFUvY/Ni+LO3tObO9/2Dk
         gp/cZK/p0v3cRaJHJYMMafU/080Jnp/GVEGB+xUcyC4i/6UyCooXwVUhI9UwlY8tCKW3
         vk3zMsNVG1bTKkews/1m0F6/ayy9cIF5eT19N8ICYjRjPK0tC1xIc+g1N2qeY3MAXg+1
         E43yJBZln0jEKfEgcv+3VI8vmSblrUtQ1fmMRw0jG3iE1sIX+OFy0O5HzX0ig3JJcvPB
         zMCiW2HKEMvjtj3BUwj3tpeKV+QabV22v6IBbZZQTIYRxBfdaMbwuz/CrG2L7L2n+rPn
         tbZw==
X-Forwarded-Encrypted: i=1; AFNElJ8r+9stGnWNEf6PMNNDSUWoSu7Jk16JLUz1rMwtvIEA8w65GFMoruEzDzm88I2sEYj7wz4HMze/7Gff@vger.kernel.org
X-Gm-Message-State: AOJu0YwBxH8xyHck/YFrQ4zve16fTblXNe5fkPwdDzucj2mCCsRTuHNC
	8VztoXD/OKtErMRyOU/7iRbwc4kXeHtcpHxGx60VCxC+XB4Co3qB0p8/7FacK5OHLL/2nyvX7I+
	7U1eXSF4emh3nf/+l1TVkM2XMX1OIf3FUS8cpIuiAYq6+Jpwb309NoTlFqIuH/TnQ
X-Gm-Gg: Acq92OGudC7Yi0uFzQ7C/DPop/+uKxXMFnCHrxg4lHYa/tPcicbXetPby7wbREdizng
	Z0Jnq/nKrHLwqCeVAdmffcPxi5+msXjgWXLhkOb3CEcmUu+2eKfyeW3eCpuVm+8CZZnNaakMWK8
	w5WtTIqqkbMPWcEay+mXWfPzgh2WQM7k78KhfADkN1+p03MkmlfHPl0twW7d5CijEbP9l8iXV5g
	2XOOnKkM5M04yds8hAXbmxHDdBd9/7wN01ZeDPYcfo83kFPlqZJRmZSwtwklyPTOoey4g5ZLg8T
	xW22QilqXZEEOINx60VcVyxACX0ZCEE5EzGlujBaOFtt5IsakcKedv+GulOcBq0Y2FjzlS1O9w7
	UzHb7/l0ZgH8GR1ZEkN6ipCu1zn970g/CajijVnPZJhVD9A==
X-Received: by 2002:a05:622a:8d02:b0:50b:2875:5782 with SMTP id d75a77b69052e-516d43a2865mr126389821cf.6.1779713731900;
        Mon, 25 May 2026 05:55:31 -0700 (PDT)
X-Received: by 2002:a05:622a:8d02:b0:50b:2875:5782 with SMTP id d75a77b69052e-516d43a2865mr126389501cf.6.1779713731405;
        Mon, 25 May 2026 05:55:31 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bd00e751sm3897925a12.27.2026.05.25.05.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 05:55:29 -0700 (PDT)
Message-ID: <60f01a6d-015b-4a6d-be53-a5394ef0e037@oss.qualcomm.com>
Date: Mon, 25 May 2026 14:55:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/16] arm64: dts: qcom: shikra: Add EPSS L3 interconnect
 provider node
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-6-f51a9838dbaa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-6-f51a9838dbaa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8P1YkaPk4e88DtzT7nQGjPXlMkbMDDPL
X-Proofpoint-GUID: 8P1YkaPk4e88DtzT7nQGjPXlMkbMDDPL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzMiBTYWx0ZWRfX5iQl+KI4rEhd
 Pq+XUU5kmcGEiJgU7tpGAE+NUXJqgxaYEuHLsIFucAyBmzpLafjOyJay6nXEXEkn750TdZbxv8y
 FkFbhesoTjHf2ygHpAIDr2CoclrpOf8Au/Cu4t6FTBUFSyL6acMk0xHNzcMyfXNoiXZEiwhZjP8
 JA2gtVxjtNAmHAHs8eCdlRQGNmpzoiI7IuNtP5EEKvbpr+L6aKFckt8QR6naiyYtUQbEsBr0/GB
 OH+zY2HEUMXZhn6CNcoLCsJh0vVF7JFx3zIKymQRlusDJ/jR/fYOvph0Zto2qOqegXDJUQBBJZ7
 GXUoV3G6TmDYey6GfrNR9xJBTC8c5C4Kh+Aw8G1BOX9ndJm30WibD4p4crLhGLnMFtdUvdd2rge
 +rB/UD6JZDFOTwOStRID6mRSQTFsO9ZEdtF95wGkWLABZ2cDfhTpIbiW9CrZWgQwWLrNeq1rCk5
 67EzsBpmqn90WBAFhKA==
X-Authority-Analysis: v=2.4 cv=D8F37PRj c=1 sm=1 tr=0 ts=6a1446c4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=sDloKVZszu7f_yhO33kA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250132

On 5/24/26 9:49 PM, Komal Bajaj wrote:
> From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> 
> Add Epoch Subsystem (EPSS) L3 interconnect provider node for Shikra SoC.
> 
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
