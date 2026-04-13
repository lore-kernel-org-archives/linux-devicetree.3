Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6624435FF73
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074317; cv=none; b=oHWR+I8IxF6iVoI+scgXoGRmLqe9zTdjqZ7spS51Oe2onQGlvwJL68bCyBO/nKPNc+hD3B4uA6XGtCcKt2V3OCtq1BrmylgqjWamkiwwyPtWnxJ7clINfXriCgzLs1iFIlR8PZ5yr2lQUyMh3SfRhoia7Wd0izIor1KiLyHQpnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074317; c=relaxed/simple;
	bh=bUMOaqMPAsCT/nbli0ldz/z35LS6QJphElFnOO2VfSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T/boR6VzWyuzd/5c8OEtxJg8fdtNb8ar0rwIUhEXKD0ueZt/f996yDOMBxh3hikZsbDR1MWsk/zV5zUPRRvJPjfLXuAkr7f6S0cd+vAmYVgg47ef3sQn9hnL8LG3eFZ5IVV9/iw7pXfI3sDTpfZpDTkSkgY1GnN4d7F+voacxkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T2qqyx4M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+PnUkua; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T2qqyx4M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+PnUkua"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D84k6q304353
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Sgk0kmsJKoRxvHNPoo8Dt6uNcK3kKUI0DDx6D9sQO0=; b=T2qqyx4MpNejlRQE
	h9S7PyDW18sqeHh6oMmpz14G6eqPGGtGo06RPBJ+IvJTJzhiaHlqMy4W12IpocFc
	BUyYwB/tFqlVjwoLcy/+70zu5djzgXlA1MuHp86jxutPj78rIBNH/cSywlfOcBTj
	zscSQ4cXlD8pOfORpupVj24b+hBQiU5WRSi3LEfKjF6Sy03ZiNP9sxowQkuj9F1r
	c4ykScwrqXqNK5/v19q1VTpGtEyuATpsxdthxRZECq5aSYQqW+exy/fxXY47jVQN
	WnqrHo4g1SstbRSWgV4LZFgcWip/OcphZkjXRbLNYPY6mwUypVulBRE9e2rvgVrA
	dsMDlQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewkvu53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:58:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8acb4b340f4so1228606d6.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 02:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776074315; x=1776679115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Sgk0kmsJKoRxvHNPoo8Dt6uNcK3kKUI0DDx6D9sQO0=;
        b=H+PnUkuaap+szKNdFMr73rK4tOxT3c7vjkTb+rh2lH6wzgg8rOFO41J2ObsxC2THgK
         VtieOshZzVHXYm162l8p4E5hl2/31c8h0AfX7aOIY7iuhswVKXZTxzLhhMiSCpifxMiA
         bf9WFK8eWIuDglSxSRKnbt6zfL0u43R2JJ9u6MMFkCfMqzbZRV25yp6OY9Vkpy7Ndt6i
         NVC7FtAlVNtBJo7x/HAbbktc2ley5a9XrbcYMY/2NpO6WYqHwxlbvHqsqdUlrfV6QHpo
         fD70aprWb7bk1yu7AIpwghN4rZiKXW8sUj6RBPOiKMQimJ6nvp28FpcgIXI5Lajc0A84
         bfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074315; x=1776679115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Sgk0kmsJKoRxvHNPoo8Dt6uNcK3kKUI0DDx6D9sQO0=;
        b=ACyaZ/EQbK+kxW5sSs581v6D+Ro2feC0KyohLAfNOFSsiQdXiWr12s8O/bm3riauUn
         9IyFGQPIZL5ZhZvJQijCyc2QqkQZhMzhBefFkMEg9uss1q4jd/HGIHABDc4PSRlpe9jF
         RgOrBs37miX8s7X0mkY+cq7lamEFNrhOLM809fIFtRrRfwD3e9cEk2WVnooLWbnkluUv
         +iDUzrZyyOo0S7xl8zgfjqQhqayKAwkCDfi9QUAbk8+hxhTuvfLk2GDgE++EiSxV+uxm
         o9VmLydy8EN/JuoEV4CBfYtNyKN/A6Pc5at79h/1D6FFacmxSigqUmefuCa9F05kwWIY
         ontg==
X-Forwarded-Encrypted: i=1; AFNElJ8QE8BbBavV3bzLyzV8EoStv+cHZSwoPzl8ll2NpLEbPBFKNmQ2PJTi6i7HrYhNYdrUOVvCtPyWGGuh@vger.kernel.org
X-Gm-Message-State: AOJu0YyAqqCrFNNNeYrmMiy1onUtqcXfstJPPJIBAV9lOL5QBpW6u/8Q
	5z/0CumNYMPUPaQL7r+jhvsYAUSdHK9T/sNGqljzXvSv4sMcNO49iMeD8ThUb+3Ub5FSeOO1s2B
	bnUF173ERLq0FkgnjpoHGxZXH9F3eoK9UwOFfqev0DjY8nuw+XDMoMFKWmH1OIVzA
X-Gm-Gg: AeBDieus6TGbunc9OqRYGe8G5mvrgX/iuIChts1lYA+tkm5NCYGHRngRfaF0CT6NwpL
	TwUKkcHvwcEr8Lm3m9Px1Ew6AUAElI1d0a5s8UqRtgB2wuf5Gk0ekyA0XWlZ3l5QUqv3lfZvwdx
	W072xCnb976yCbmZGjayvn0gxo6J87ZR6mo4C0LMwNyVVcZBkYpqD72FHcK+T9Y/6+PtVEfpFh1
	ag81iimejy5u1OEXzmQJICnBkqqiD3+sj5lvM6qa1ItQitVWwY8RsesLvqx2x0HEN3JfGqR9iyX
	pa+6ufMd8WmeBrAXATTiCK+biW7dXgB2ZnV1bdM0iCF1NJi8/DGdaUjFCD4MNQlBzliR4bVr/QM
	WNLVxBXXXiD8P6t+g1oIf49IAjqrQiiP5zV+j7F/E4+Lxg6dAOliVblcE+GdnLmZY19g32wn9rg
	lj37M=
X-Received: by 2002:a05:6214:258f:b0:89c:d639:e7be with SMTP id 6a1803df08f44-8ac874bf3c6mr134115556d6.5.1776074314818;
        Mon, 13 Apr 2026 02:58:34 -0700 (PDT)
X-Received: by 2002:a05:6214:258f:b0:89c:d639:e7be with SMTP id 6a1803df08f44-8ac874bf3c6mr134115396d6.5.1776074314343;
        Mon, 13 Apr 2026 02:58:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c583asm289905766b.36.2026.04.13.02.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:58:33 -0700 (PDT)
Message-ID: <b4d10bb3-89b4-42a7-9362-8d43d117a121@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 11:58:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: arm: cpus: Add compatible qcom,oryon-1-5
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
 <20260413091625.607976-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413091625.607976-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69dcbe4b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=3VPC4Hb_SbXWmmKAefIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA5NSBTYWx0ZWRfX7S8FiqGXgP2A
 aHdlYu6luF9WoPeyZ+FEm3WTtv3ukdCVC5XAl5mIeZJjHhIwHFf6F6999vJSgh17F3vTIvvuvYX
 YvT0CNTJpzvVp4P03PaJQYpE8WKj0bptya3aT8rqfMz5CzDTOHfdBiUcP2441/yWQLZpJk1E4Ia
 96WzU2SHwCAHfqO7CgU2cVuzdZbZ6fOSyDluhEEmRtMY1icQCUNZKnwUqAn2TUrs89p99SG7xV3
 ufqsqsaVwcITwwHrWTk+vp3ANKuQbm4CYFr25vhauYxhZi+E0pSRYhzYFPx2QDxDUco2IuuPOh2
 Lt6/xrEFvutGV5Ye+GOEeTXKyhKxjwWGCs5fTAXDXjxQGVhh767+UohwdMIwwOThSFuMNxGl+E/
 8yt3J2PjLsTFNeSnptE0QxbeHaPRh7qSVWaQSiTkfC88X5AcCVOwOzGu6WcqOo9YzQWBLJLDn4F
 HUFIhF/DelmgsZSKz+Q==
X-Proofpoint-ORIG-GUID: uS4EgC7QQ7bH6Wti2TC5PDSRKXTWYyvO
X-Proofpoint-GUID: uS4EgC7QQ7bH6Wti2TC5PDSRKXTWYyvO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130095

On 4/13/26 11:16 AM, Shawn Guo wrote:
> Qualcomm Oryon 1-5 is found on Nord SoC.  Add compatible for it.
> 
>   $ cat /proc/cpuinfo
>   ...
>   CPU implementer : 0x51
>   CPU architecture: 8
>   CPU variant     : 0x5
>   CPU part        : 0x001
>   CPU revision    : 4
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
