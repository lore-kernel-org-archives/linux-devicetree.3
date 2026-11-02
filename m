Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627279;
	b=hBVZVY5jF67HR0LZQhfNjIhJzdphVstnE2qQ/EuZVh8PEvq/2ieSri4PWLmHGMfR7ga8
	 H/Cn2B6QaKhd2pfKff3kYARqqE7mN6Pz/Hjqt5lNZdewPdAf7jKqknkPVm+VhAuGF4EvI
	 MVaVntBnnG+oSTkxGXCahsADJrE4vEJ+cPq4Ek6M9MGvkXr2t+AA1on7ITXd0lzfpGkAi
	 NcF4KbmRGaVUR9K2l2knW6KVr7AgrvqefBR53TrNwiLHnbufIkTviE9d4Nahs/Qm3qNbu
	 vLGB2sVVubqnDjscDV1e2y3Kjgr27zfDJqlP43ATQPWp5EP9kh9gGOD+VcDfIUc5RSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627279;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MkXiy7zJNKorCt+VPjjrN/hR8YEy6PfDMROpIRVksVM=;
	b=OQVPFW5NExID7hmj6ZJrKCVnQ650SldQPfdvnUk6ktOGXaC/9w/xIPL0eXrmj/ctDWjX
	 d9Mv1ws7sTP6YLPAGXh1fqaIYCUbcvn/v3RyeJklx+u6VNky20YgMC9HQ74qiIL30/K8D
	 hnn1XFHmHgPGv/zAYsYSzCLsR61OXKjOff7GrbfXY1QNSiXhpMxIJ0hPlio22OJN6zqAE
	 Moumy+IM8wOOhluhzHQoZ8kuglu1I3RoY15bvzE1lcaPbeopEM9CHDqWWxYO7NeybJKSE
	 Sv7mE5XiWZxGqMahKCPo2D8Z7MVQ1m07KRSFcIFStmi7JK9JlX/tZkHwpEiePwAVALw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fgg5wZjM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q8CNivWz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62881606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62881606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fgg5wZjM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q8CNivWz
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAQVY757061
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 13:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MkXiy7zJNKorCt+VPjjrN/hR8YEy6PfDMROpIRVksVM=; b=fgg5wZjM2tsbZBkn
	gv4uDezjS1ARS8eHK17bP4DAvYmtsQuIvfAr2tx04FElPw8Stx4FFQW5AoH4UgKl
	dwwEgGU8l7n5dk5f1T2bZc6zkMJJHx/rqGudeOq9FjFTVIDPUgItrJUBADr8IWV5
	MjAouwmiQ4Su7nt2UV9xABytogc8WyqYXMcD8lzpsFPmR55d3lQDOkmwiKVChmpi
	x70nvnjr+NKdzgGmsm1bhw38QubFbm05e+/ccyDZJhkQ5pNBUBDrJ0TNUdGi0D38
	IPuWElnFZAhsKitXnt7C7P17WYyTggfBEd2Bmv1DPlIAUnRdBKx8SQOTu1OSaFEm
	2/6Jsw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1sv2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 13:47:58 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73a1cf1638fso52747137.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793627277; x=1794232077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MkXiy7zJNKorCt+VPjjrN/hR8YEy6PfDMROpIRVksVM=;
        b=Q8CNivWz/OuNq4rsa0e+HGI8895kQXYwvVySlLLXGJUab7PK0ZeADc5rc4Dqjt7N/v
         HDaAVJjgphfbOAWBijBZOJ+6mT89rJW02XgslvYIBAwjWZFqHWFd4Jzj6JCWWFlUqFzb
         kystjtzIT60pDvujDwzi4LYPHkoFolv5iJUyHXTqYlYl5vjStOE9MnZIi52EgXUljgg/
         CRawSGQSQBMyRqLg5G3TokTmwHBk2gcvVkwJem27VLBhX9coXdMk/aja0aerbPk4EftU
         AfkUN0ERkRD8QGx0OBcCUgpFDJlKwBpunS7aUcSg4YkRdFQKk778/MgjAqi3aBGLuFrD
         8J3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627277; x=1794232077;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkXiy7zJNKorCt+VPjjrN/hR8YEy6PfDMROpIRVksVM=;
        b=SwXVZaubHyCEd8ZBeF+cJMsSc3pHLCzdTg9EMiqsfIo8ERnGu8Kes5Vo6Yd0yWDd9H
         HA6SA9Hu+T4MRhDhXb2YvNt6ARDYBYwY5FnCYgIQC7GeNld5tR2wJJBnAAwwdZb3bHsb
         HKbHkxbo8JgjGXJCl6nfJoysfprxI8ZlMR+tr2ODGS6LRwNQLS0nChch6FILsOgnWWbg
         vIIIJILMyGXqm9++CaGP0E8fzRb4efk9xpeKph95a/T7veI5jeugrz0xnWuVQ48gE9Az
         25ZiD0Q1c9GDa16RW8YHKzESiVtJlXB2+Ps9WPIxHjBmvPzKP8Lxeut4a4l2RUI1tmjC
         xsUg==
X-Forwarded-Encrypted: i=1; AKwUvBwDNW4vvOGI5aRFGvibutA6cYwt4REFqfr9BVcQyg/JpULiO8+s5mZA0uFvjMuOnhKwfEQohT06gXyk@vger.kernel.org
X-Gm-Message-State: APuU4Z/Dwt9xkHpn38TOr2ugGc3AtZKFW064Nbzv8P1ebQKiL90irIze
	jIPJvdxYBOd6t/ldsuFjNv2ySsf6X5grAQQA70Jbl4nlB1356CAwPUft1L+4lizPo178/Z/CQSD
	gbqzdgblpc0t86Sd78M2n4nU57vPfUsId4i9Kk8OXvkncBQVleb0/VG1NFkTAq4OB
X-Gm-Gg: AYBFou3Q/xvn3hMvaCJYixGNwPVu07lnFFlLYtf33P0z5JZA/2ou/O1l2tM03kexi8W
	jTi2J1+hVhtoqkhd1l4FOcsCHpC8qwf4BdXvCBaCw8QCZa+s4H7xSB4ji1z5qdPkxov/Q3feFDj
	HKmoQB3EdsSC+grQmAsor6gCjT3Wmst9Ol0bq8mDumBsu8fUHseKOcx/vvvR+be0MRy5euAM9Ju
	ojIN3INdf7UbNIsVTOKJy8sretxtSI7mkT3cXykj0jcxxEnK6QPkbGm2/t3y9q86O0Z9n4nO1b+
	/FIgIZMfAGLOyBxuFdJeu5gfNCcqbhbctSj/e4ZUzEO61EftHZaK8zk7Sl+zuHHEGA5pEq/HVR5
	Z/D0d6eJuQt/fmO6WB8mAJR8Mmv3aD6A7QczOgGTrSZxnTzdGK4dhULhDEMMH8gPtKywmQdc=
X-Received: by 2002:a05:6102:a21c:10b0:7c3:99a3:314e with SMTP id ada2fe7eead31-7d071f390d7mr3263383137.0.1793627277468;
        Mon, 02 Nov 2026 05:47:57 -0800 (PST)
X-Received: by 2002:a05:6102:a21c:10b0:7c3:99a3:314e with SMTP id ada2fe7eead31-7d071f390d7mr3263376137.0.1793627277041;
        Mon, 02 Nov 2026 05:47:57 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca29382sm3342417a12.37.2026.11.02.05.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:47:56 -0800 (PST)
Message-ID: <e27e0fd4-c072-4d88-8e3d-107fa7a97923@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:47:53 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add Microsoft Surface Laptop 8th
 Edition
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
 <20261027-mahua-surface-laptop-v2-3-7dd903a12d22@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-mahua-surface-laptop-v2-3-7dd903a12d22@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0xA_NxMAOdojxtXC3SrEgn5XFkkde_9x
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae8948e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=b-6vMC33NXqCuZ8Zj8gA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfXz1fqYg+DXk86
 XPUcIK7a3txL/njiLqbx6Ee1T8/Zs5Z/xGpd1rBGTSJ9w1IbLHqahniqoIUVXkolDjWeECXPSyq
 aV2ZJOHHyQLagrwGJ8MUSag0DKkJBzg7NcwpNuSISbs3Bt8ZFZK6AZfMOoLHwrZ/FbNcH56YW8v
 vduAynmwi8iCQBC65t1kMiyEXMBj37lgm1yWAmI0JiyBddU2hRhfeX/Es4IrP2FU10/Pz72z9qQ
 m+8IDBu4XqKinH2ZyuG6Sye7n/6fM0LlCBuId3ofiv5ofKLQ11BAZcIgZsRzRPr7vkmvnWZuJa3
 WbIeLGL0xrBU2LA9V21lXfqN0jwDJn3cd/GBsa5ILAxBK9DDP37MeJsHK1k8U7WkmsG8vubHLzk
 Bkdgger1KHQWOjyJqBHYmj3tF5vee2p1Wgsm91xvopWW8+D6qNETjhi/I9ssIXSeRNHPATmpPDe
 2jZr0DsEBvxoPhKvXhQ==
X-Proofpoint-GUID: 0xA_NxMAOdojxtXC3SrEgn5XFkkde_9x
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX0R0D9Y3LYGaI
 LLRynhUb2o4+lnBQwTijl5bdlfFw0VQFx9iuqiHg46mQHeUct81NRN2SBCwAtKGg8z0/WsDEa/J
 z03pOkzrxqXENVzuMcUShw5e02CPnXY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020054

On 10/27/26 8:33 AM, Gopikrishna Garmidi wrote:
> Add support for the Microsoft Surface Laptop 13.8" 8th Edition, which is
> built on the Mahua SoC. Most of the board follows the Qualcomm reference
> design. The keyboard, fan and platform profile sit behind the Surface
> Aggregator Module on uart22, same as on the Surface Laptop 7.

[...]


> +		serial0 = &uart22;
> +		serial1 = &uart14;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};

This sends console output straight into your EC, either enable the
debug UART and point it there or remove this hunk

[...]

> +	reserved-memory {
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			size = <0x0 0x8000000>;
> +			reusable;
> +			linux,cma-default;
> +		};
> +	};

This hunk should not be necessary, it was on Hamoa laptops because we
didn't have control over the PCIe SMMU and needed a CMA space

Konrad
