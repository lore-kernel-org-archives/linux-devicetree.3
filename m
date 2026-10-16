Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275802F616A
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 04:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792126184; cv=none; b=J2wbc5jyf6iDRlHueW0+cbQjsM2+0j1EXrPFkPZZK1HUVQiquuIbhvGew3aQa0W/iInKerLN94DQz1QwLrzYaCJxB7m8vdBCck5MvNOecEIGLus9Q+2L8YNtMAC5BDFalakrRN+8NB6l+PP83FQDvdlEthCmg73i6psItjQuf9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792126184; c=relaxed/simple;
	bh=P6QREhrPkh3hAO4eclPMZIrbH6fv6en1gjJrqbnO1H4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ivDWP1tuzp0uXAXeEjVyZu1+N7cSdym9lsJncfHTq71P06fBx5NQQHhFI7nWVMwiLYeiuJdrSeI42mgTxpdk33nsG8lzx0dqRUl+d6M3a+lBuFM7CwVkgF8U2rXZggte25EBdbWlBdpkDyrFwcq+oOTrDs7IpzIHz6c7evtxGPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PT8jt63Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NrzT7+Mx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PT8jt63Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NrzT7+Mx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FNCoJR557676
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 04:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	th64apxFgLFzfeQxoVzys9Au+jR1F6aa7MWWhFDWu+0=; b=PT8jt63QnZfmFmIQ
	pp9xhv/Y+xzLWZxYVgsTePa0aTFkNJ5G1oSbaHloDyIl4eNxP/sJoJSUTC5GOUY/
	VEI/s8xTaw7XuKiQoT1jgiiMIhVNKKZlgQzSZNkiQWySQwtkmwIjL4hsxckWr9wI
	7IfoCwI4Iw8ETNouWjM2x/jwZreevfbpeGYEiLWMldUzZ2xZJ0IrHBI6UkAPLxjb
	/IjGuqjp47WigXaSnQ+EQf9iFCQjmVEtXQwBHqPAQsFXszSr4uatKLSZ1d/8/Dff
	C+7eYv+FjrpdnV5ApOqaRf1s5J59H7J5eY+s9fxYWVubolf3Dv2Ut7JJLe8kgL85
	gzrItQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a88xk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 04:49:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a4d2e39acso6327519eec.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 21:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792126182; x=1792730982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=th64apxFgLFzfeQxoVzys9Au+jR1F6aa7MWWhFDWu+0=;
        b=NrzT7+MxcHq/Jtiptke2kySJ/uGMD0lWbxucuOSeXKz7sQnJW1A3VznCrBG753ydaT
         +MNqNUb4GcltHwoYT8oNvKBfXQD8z1oGrYKweq7vYsUiMSXZuT51CQ27wsJ6Yfxap5/V
         gNPuka77fr9ytExG4M3nKKEQXbHzik8UQRji+nTavK2+tpZBpD0KlPsjWigwwQdA7KAx
         1vgDytrniNAJEiw0Lh4Es9z42cOpbiVMi7APCVFDfwYQSEXzbS1PFCia9rgX5bGsHq+T
         glkiuyrtXbQdFXRQP4EBoxT5xychLCzvWpA3i87+EN8rl+ASysiriJFi5KrHnPpTJL+y
         6xFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792126182; x=1792730982;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=th64apxFgLFzfeQxoVzys9Au+jR1F6aa7MWWhFDWu+0=;
        b=zXwtbvZfxUcWhYPeRu5PDlVgXftMWph0R056LafmPLDlXgucDWp4ATwCkzQp83/0f7
         bB4U1tqdjUVuvIkpdaghFxyFq26pMlPd9k3AwUK+PDHHLPJx3Dsjl2I5thviaaYeCTfT
         +2taomyjkB/AOec77LceWEDh4MleZm8s/2UH4JXSXtJbbKGjC5IShSvVFT5E9EELjSZL
         p3JBF19Or8cSHQVFOOcZ4oxnYEiPIaTp2BJXz/ZO0mUArrEpatNIKs9+62hDgrdky07O
         eU/dcQ1Am/citKhBU3d3srB/iIuNYH/aGtilqAOIT9Vo8pgljpqgGXo6AKiYQYkdDF0c
         MLZQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2JGhebphLjqLMdefbvh37mavPJ5tErBwC50xtj9V3E5xMoBYffLjbSXZimKmP3kLYX2wph5rRPpwZ@vger.kernel.org
X-Gm-Message-State: AFq9FYKnVR6z5PYUUv+btuCsduqD+30uwrKGpCD1HfLemZJT9BqG72nR
	D0zNzl/wxYFyZvBJy67WLl7UHtCUxAbCyQak31zmTk2rP5wxtNN5K1c0Ns1fa0F6xRcvKZL1C0e
	EkvrmWVwDlF1jIdKBgEWkkHkg7Dk+aEZRcl+p5roKZuUDAdNYPhSdRQJfl9xwELKvhcHSr8oNLT
	s=
X-Gm-Gg: AYBFou2k95AhWQA9fJVLMxBcIBAbhB5qRY4gcs2jOL3me7U27o4PLPIQNBEnStm9z7t
	9qQmVFzbrD35GNonBdJ9AGsBlKeWuSiG3EbHZkdnnpvuZx3NZ9xctqEDrb50fO57SlF8kLrKL18
	xTGcuH/b1/3pazjnsNCiDVYhgd+lM01EGfJGuI/IvQfENyPdz2DyxipXDs0IT+/EtXhhufLbMf6
	UK67yy6IgjljUxf1SYLvK4xj4LyQyZGQHNlurrfrbPLhqMyZ+fi6Qq13Z+CwonEWfz6hAYhdQYr
	1m6xGBy3qzoX+U1lnCUGfB2lbPhc6DQA7W4UfY7X4OEaUnPLFkO+a4TarZQKWSotR3RL2kAzN+j
	Lk0Nsc1jlXKdjuAd7KBB4yznKgdd2
X-Received: by 2002:a05:7301:d193:b0:358:cddd:5ba8 with SMTP id 5a478bee46e88-358cddd5c1bmr25526157eec.13.1792126181433;
        Thu, 15 Oct 2026 21:49:41 -0700 (PDT)
X-Received: by 2002:a05:7301:d193:b0:358:cddd:5ba8 with SMTP id 5a478bee46e88-358cddd5c1bmr25526126eec.13.1792126180897;
        Thu, 15 Oct 2026 21:49:40 -0700 (PDT)
Received: from [10.219.56.188] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6ca5sm2837094eec.9.2026.10.15.21.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 21:49:40 -0700 (PDT)
Message-ID: <d4ee5594-293b-48fc-946d-db086bd9ca18@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:19:34 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] arm64: dts: qcom: sm8750: Make the ADSP remote
 heap no-map
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
 <20261015071511.977-5-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261015071511.977-5-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxOSBTYWx0ZWRfX3SG/Rauv30Fh
 kEpsbj57A0qcP+fj+S/gC67Eg4lG7RMT94up5AcAn7J1IrN6kd0tiO6Sj1hqbhoQxizedOWwSdi
 O1iocCVmhMd9npF3WcKG+pWfHn5/ozY=
X-Proofpoint-ORIG-GUID: h-NIyyFjfKucUeUPR8UiIrvr89F4dOQ1
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad1ace6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WxrJ1OjRqBU2I1o4brwA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxOSBTYWx0ZWRfX29qtvySIKUN/
 fw0ugofcltQQhU4CpjzR0z3grAtAKC58J7tdhV9HLIJ9HmdALoaJ/dvdov5tCM0vlDSwl2Adyz4
 GRqBRuRh5XW6uAS0v14s6BewkB1lOS5ZofO85kITF6FhVEXpcEvohREiBlZe0+6Ke3WGkw46XiO
 aCgJ4X5MHvjO9EMFiG+/VXUE6XnmuYueene+js53X/uzmmYSYaJa8rUjY3+IY5bPlEdhxLaZbx3
 oA0Vi3pEVr10a4NStfrdz22ZJoMzZSYsS7CbNSlLwMj7rURVwD/3Je3NqOBFTp7oGU98zZiNTjh
 jaedLfSCzsJnLYM5ihp+RL4CGyicrJBMplN8Lsb9TrU7Z4dLqN3xyweIoVSh43L3JMvKrLx1y2b
 TMooKh1gWLvqMXaYzQmeloVbW8M3e30hmMosmv+QIVbecgx8F2ruWzhMT+3XyaegBw2Mcu9fLq6
 4Vmj+oXNeLa08J8G6Cw==
X-Proofpoint-GUID: h-NIyyFjfKucUeUPR8UiIrvr89F4dOQ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160019

On 15-10-2026 12:45, Jianping Li wrote:
> The ADSP remote heap is declared as a reusable shared DMA pool.
> Allowing the kernel to reuse this region is incompatible with handing
> the entire region over to the DSP, as HLOS allocations may access
> pages for which HLOS no longer has access permissions.
> 
> The same configuration has caused synchronous external aborts on
> other platforms when the kernel accesses pages within the ADSP remote
> heap.
> 
> Replace reusable with no-map to keep the region reserved for the DSP
> and exclude it from the kernel's standard memory mapping.
> 
> Fixes: 0bcf9ca23a873 ("arm64: dts: qcom: sm8750: add memory node for adsp fastrpc")
> Link: https://lore.kernel.org/all/20251209-sm8750-fastrpc-adsp-v3-1-
> ccfff49a8af9@linaro.org/
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

