Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13F24252B8
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331363; cv=none; b=PjjlTFiNTW23wVobzwro9/AuEFu6VRsVB0Jp3Z28Ppi+2/9TMNF3EbiExQQjaGdURQmwFVaAgQwC7I9hwSkbm5S1IOM8cWmh2fAv4j3j0sOOjH0bZ4eNXfWC4tITtqUG4iOx7B+R+LdZDyCwmRTITubC1GNgRhme3n+C7kWBTL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331363; c=relaxed/simple;
	bh=cuf2vryU3oK02+rbWYpjvQhDwO6Py6xH0zvCGEseqRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JYhHn2I509NBn0dp076/d9g6IlCg6Xw7Y13a8q1haSBlEdTv9zqsKTKxDA4iGzQc4BtrkpYu0vZgUF3rOMSsMaO1RHTTt54JNZUatu+ZS7llMrE0Zz5V24hVxPk4dPH2TNPBc5drGIxdH+nGTdwVRvAzmpibO9I0Are8qNIO+Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hj3Tjujw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sx/W4pYz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hj3Tjujw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sx/W4pYz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66694Id64180021
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cuf2vryU3oK02+rbWYpjvQhDwO6Py6xH0zvCGEseqRM=; b=hj3Tjujwhl36UrmW
	H2QYCISUJdJDfbMUO2Lw6b3zjY25Z+aCiglzIuLaRrqY48rQB2ah8PaJL4xMVQEl
	a6O9lnUj30gDoK/ubSOke1NfCP6YJOvNp+6AsNSIAQzjJEL1WRDvQ5sFhsanV3xl
	Ms5KhCCIsnDfKZMew1rFxYk4Fhlhjskg4CtPA+TdRwN7Q37Xj7hH+tiIK3k5QUOL
	gVzozbjAVfF1cOzmKuyX3Jb2+FCFy58UK7SdXp19ekxqA4WjH8sZOe6f8NgCwWz2
	sTcKarWIf+fmwRdjghkoWL8DC8bx9VVGVMJE4KGJ+kDK6lIx5mvGh1IF979BYUHP
	h7GkkQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txenfns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:49:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e21552dso66669785a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783331358; x=1783936158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cuf2vryU3oK02+rbWYpjvQhDwO6Py6xH0zvCGEseqRM=;
        b=Sx/W4pYzSTJDYHgmjzvKXGX+aexGC5bqn97JploXTUf5or2vKihAh3Ra0DNLHkRu/0
         0Hl5ftHHXtLv69rAtip426JlDeMF5xy44Tl+iokHCAyt5/XdId5rTZ/qnvbw5ADuOSAl
         cEpwm4OomYMdPmwsT695IfVaX2RBTStUpKgQ6JmPUmjb5pUjJJ2F9U60CfFnJt+HfE73
         /6yOqkHORm4Wq06qL+1gx1/0x4WouvHOPNOJQ5HUjKtlJq+9HwV+VWXdlBrAIqxRdZcp
         esWIFd/gpplC7MyhXrakU6tzvdnRUJGwMWnsOFDRGSnj3yYzA4pw1KTk80sC93mnyV5g
         BmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331358; x=1783936158;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cuf2vryU3oK02+rbWYpjvQhDwO6Py6xH0zvCGEseqRM=;
        b=jD62v7swLnadrM5emLp/UUVi9qofVh7msI6RFeEvZc1asV1yb07OolxmMh49na3yD1
         8+KTDAyvpREAfubGozc3IKvGwcBarvxNDkM7fmEdcT8kqzHbeUuqBGr16fe/KZhnrFR/
         ZvUz3RsqFMD//qPmsnkwL/sYbsqwexnovV3JQY8tniN2bSxYbBN/tZyMKhdfgRla0y9F
         k6U7PsZUiV5IcCvfQ0WcyAsiN64YFFDILb9Rr3tipGePaQ2O16b9Ujta5OTjw09gtb/4
         VLcWq01PwR87cOqV91VEP9/s1Gz6+ddZ8KZLlZhnABoYxV6fR5G+9cDMJejoY0aRtpWH
         xw2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqd7Q4IO8oIsDaAtmdT4XokEm0+XAtETiCIBFBIKEZWh8sVh+NttcSGEkuv8+HvvH9cSQcL8eraM+dh@vger.kernel.org
X-Gm-Message-State: AOJu0YwpocShmHyvXqK8L6sxfCTmR83UK/TL/s4vSdTlhWXWQZjc+3w1
	vZ6uSOoX/za8JsVAFqwoumFvGQDCD+/JbP/6UJC9ujz//0A2yQkV1ZVd+iHwcBtt0wMFFZe/D5Z
	Mv0GCrTjm2huoNK/2HRdf9ZGAcJW1OKU8E4o2YI9abG0H3grBAPMYGm/Ng9RSEkrT
X-Gm-Gg: AfdE7cmLNGltjiFyFwnjbiKqTd+51RWRVp+jQrdjbBoAlqKzNKft8c3PhfDlGH8p+U5
	w2p1LaTUsx5f3Fb7cOP7p2fEDnVdo2bbJHxlOT7ujQVGlQFCoGr1s1N/n3/UEiMG3TgSoHLJOaX
	8j7dD/DF4yppY/Thm7dawmtgXVWp7ZBHk7N2PkRGO6/DqKFXcb1OqxYOWYZhNVTZ1PSPq9WqRO/
	BHlXLZ+9EbvXFCVIYHALzJvaeNJ9ZIiyNr1DGNgpEIAjLqNCcCAWgfdXl0vpEeGfzHMAc4N/fyj
	v5sAb2BQ+a5KZxpeSPewMiwR97ui22Hh8NyE1QqO+qHJKTeR1NI2eanYBFe8tHF9BRwzCvCFVd7
	wLoGgKIkdQJA3okAqFTuKKyOcDmMi5FKC0yk=
X-Received: by 2002:a05:622a:1650:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c4bf02ba1mr82625011cf.9.1783331358324;
        Mon, 06 Jul 2026 02:49:18 -0700 (PDT)
X-Received: by 2002:a05:622a:1650:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c4bf02ba1mr82624721cf.9.1783331357658;
        Mon, 06 Jul 2026 02:49:17 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60575c4sm711556466b.9.2026.07.06.02.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:49:16 -0700 (PDT)
Message-ID: <0c6fde07-990a-4c0d-b1f4-34cc61d905a5@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:49:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: shikra: Add LPM stats support for
 subsystems
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
 <20260703-shikra_stats-v1-3-0aa0ec1fa83e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra_stats-v1-3-0aa0ec1fa83e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5OSBTYWx0ZWRfX7CVKTWn6uxXR
 dnL8QdHrxOfkn02ZTU/AcYEpq93mXUfpz0tHJK5RhdTgni41xlbr0/qDgZVZmdKyxTydfry/z92
 Hz0IFTOyqGHupkkJIB8criwxm7hg2zY=
X-Proofpoint-GUID: hMaWk5f1QEkHGDpfCth6vKjfqmPykeN-
X-Proofpoint-ORIG-GUID: hMaWk5f1QEkHGDpfCth6vKjfqmPykeN-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5OSBTYWx0ZWRfX6rZRl4KngWmr
 DLmcCaQ8K3/xk5fPs78tQW21Rozz4CWzv1jEEb6wdNrae2AC2MegbhfyH8QmpcI+gINlU04K7rt
 C5U0T53cpMbb2cGMLZjA2FRxoJqhqBF7CI4mfb6XEJrYxq8Zq03iaL7vE4KEROh2UBxfbDVPDFU
 kY6OFS9q+S38Y7Gk67UkBRC6dQk7LRA+rFXR8DHW/SEUR5GcLvluHpGUeZ7x9FYcMYrEOa6+uUb
 OXYVwXhNW9jt37XDQy+B1zJwOlXOk87LktH+2sspIuLRVggc6JdUoYXX7Docc3Rm2AAhlkUkaiZ
 +vkA+/zFR7+Lp49yEaTyBFMhylqoV+GszALfCr736NMp1wRokikrqZUK4sVjUpGuB1tDaEYwhnR
 x3hf2PdltEXRgEBh/Md4ZOv4ylS8xy1qSvDZYTPF5pqplk5Uj4hdbrLs1Vzk9y0YW7RmRtvRiYz
 mg9c4CmEeQaCJEWDY7g==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b7a1f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=3eTVZtSe1k2HwHUlSsIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060099

On 7/3/26 1:13 PM, Sneh Mankad wrote:
> Add support to display subsystem level LPM stats for shikra.

Explain the problem and why you're changing the compatible.

https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

Konrad
