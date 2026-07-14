Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5D13839B4
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010707; cv=none; b=ZP+QGFul2aTz7ydV4i3czAv8JWZSukW+yFWKApwcYN+7BOdngIvjdbwSWm07/9vH7da3nYrI5G66vJiJXINLDdgI91SPvZBXWV7x/u4QwhmCWC0oHA2EL6ARHXfdjcTBiDufFOED3Dx2a3oNvtE8JqyAzEchMBulBsg3vVru1Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010707; c=relaxed/simple;
	bh=M8bbw3hB1QccYW9YyMJ2o45p5E7zrrSy0cxjuc3xWXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7+n7S/+nZDdfejXF60EjiX0dQEDOhRy6UsObCvfmcPhStLp6/tu2yuCHTu8hf7MQT5O6XZUD28JE4OIqigErz4maVr577vEfZ7rIRdcOHbll1fKOWpsImq9M0p1cR/w0XI5sAxHj0MflMr3hUgOTGzm8PVpC4XESJ9cP6rUKW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SgiGSxLE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TQB0XXHW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SgiGSxLE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TQB0XXHW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SS5o3743626
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LvbBLSiulMwfLH+VelHo3jpxmqAseAmLVR/do0Gwl5c=; b=SgiGSxLEkh6wlKdE
	txnd5TiPysv0zl5dieSRzInRXzIxl7ia+wjPbPDNYZsCZLkxlYIwXOiUYqlqrvXR
	U4o3UIzhLonPcrDPuJms0xJGIjvqfPbkr+c3RfPNQKqV8E9hQO4eqWw2dyuL+Mo7
	P4YrUwTA5EnjCPXr/2tP7Rqj/6m7scI03Zz/GaQaJxgJ8bN8pFEYOxLISC5fpEwA
	G/bxN5F/2IRoqpMdxpzoORtq3Tj98muC/A1zOTGu+d7qxRUfjeoKDlPGYxuckeWY
	3QizUFFCN4khATa0YvhdSyEzhasxkRCKG3HhlBr2u78iUN9+h2XsfHvyJKNoKuV+
	DdSM5Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p29pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:31:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so36836505ad.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 23:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784010704; x=1784615504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvbBLSiulMwfLH+VelHo3jpxmqAseAmLVR/do0Gwl5c=;
        b=TQB0XXHWtWgee6NgEQiNkOcJZ1NrY03V+vU/H/TnRuKi/75SxzhNwuROxWYsNbm1wU
         cA52rXnUPTkScFzwYhRGrviV5ORNb1xv1zWdYqHk92Yzt7DyjcSeodriOP2jyDsxJleG
         tSLBcWRWVK3f0HrjdlV2/6dBXDSBKIbRz20YFPnpFf9r/vdEtREapha9tnySWhYqDA6o
         lFrovkrLZWaNafwAiC8IB1TVS7Xm+jdZCQjHr9vf41+eS4Sqd4ZbzsINCIN44CaU5kKV
         TznEpH4pqRUekty8L7hSNVu/p4NbUYNILH4+FRjm66iIcNdhnNfRGNCQzcH/RU/sP02e
         K5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010704; x=1784615504;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LvbBLSiulMwfLH+VelHo3jpxmqAseAmLVR/do0Gwl5c=;
        b=jYgN8avINmMg0LnB0lgE61N5vYt/g0DdZ7ISMW30kSIXIMtHxoD0AU3P6MsZPOODz1
         d3RSCuf9n+gStWSkCLfpRvtqa4a9h06eVa1ZAkDlDTbYYfPxmcUJpjQJal4nN3L4cJga
         3MrA5EmWUTf9N+B2NNwgizmza+zcy3rNU2/l3gCzeFjVqCUOPw2NNvzDCr9G0M6p58Y7
         6Auq9mUQTGczyRj3P8Fkts0SRALHFhfT+XiAbLPG+0tQSHtZ37cwj/8pchLMN6W+W9iH
         64M02ABnIQBSTq09qb58U48Dl/R6XV5C9YmF7cGtvg8nDbYGNNuVFNcgdLE4AO8dEnq6
         fCjQ==
X-Forwarded-Encrypted: i=1; AHgh+RoDdQrixtzZCrAbmu1ox5kVvQNghqQOOymS6LaH/TWyKa3Pz4jpckCSDmp4rgoAdAyC/fKCOGi4k95r@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9IJtl9bxcVIxoNLSl7fyUyhYMO/BvEWxz49xGcPtNTVw8FNR8
	cV31TWi7J1kWImfDuEYAkGLJoZzQeEN+55qiMwIqBFmG5GJejnLxWcq8U+X9S6upc08bENV4LJP
	HsEFvcVGsPws3KjQREDi1UuXu5Nb7DbqzBpSbaR51t0g7gkpq0QXdOfpLrUv6htwB
X-Gm-Gg: AfdE7cnogA/jtngOU5MjI8dVW9B7XMHvOx9Q58WvVNoHQRKzXI9BBvG1YMDVj6mGhR6
	gE56V45z9N9rl01VbDMmIeXVyN4tNXDzov3GzXASVo0rOWd/oYLsqEotEL6Y9q3kYRhqY0jwzBP
	YonxKQqmOVCimjAipCikloKxpJK2vPnIY/sgEtjHrJ8f8Q7u2toaVf0W0tO0uVqNGQCx0nnPfXx
	zNThIfk+rl0prGcuWHdSNx0/eBq3cAy8z4Qvvc4TR+XNBbqQHhklKd0xfWRtqgG+L4cNevQuuJC
	vrg5iQoRPZE5Lyk6MZ8jawWOKBJK906ZIpM29zqp+ZvowK50nC1TCXiagLM7rh4qwMRz+8hQ8ja
	ch/6AJipUDxsnQTdiBrximIhjTBjnKqVNt2mRWQ==
X-Received: by 2002:a17:902:f60a:b0:2cb:14b3:4cfe with SMTP id d9443c01a7336-2cef14eaaa4mr12590535ad.45.1784010704412;
        Mon, 13 Jul 2026 23:31:44 -0700 (PDT)
X-Received: by 2002:a17:902:f60a:b0:2cb:14b3:4cfe with SMTP id d9443c01a7336-2cef14eaaa4mr12590165ad.45.1784010703989;
        Mon, 13 Jul 2026 23:31:43 -0700 (PDT)
Received: from [10.218.7.247] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ce95e001b1sm54470675ad.66.2026.07.13.23.31.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 23:31:43 -0700 (PDT)
Message-ID: <8fa9c1b4-9a42-4c46-9c44-520e79540819@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 12:01:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] scsi: ufs: dt-bindings: Document the Maili UFS
 Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: krzk+dt@kernel.org, robh@kernel.org, andersson@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, avri.altman@wdc.com,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20260630220536.3803984-1-nitin.rawat@oss.qualcomm.com>
 <20260706-curious-festive-ringtail-dd8fe4@quoll>
Content-Language: en-US
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
In-Reply-To: <20260706-curious-festive-ringtail-dd8fe4@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA2NSBTYWx0ZWRfXzJTFoS/YD5QA
 MMfR4higN5rYo5Xh50uF8PsWAxu+oisYWOG6ap6ja94bfJ3JR8HOpJliWGx+vN51WnY5Q6EtLh7
 CLvWQc5mt8Me54jhmQ/xdPS8e/xXMTI=
X-Proofpoint-GUID: dOtMzLiF9qCb2env8O94SvffBnaCzKf1
X-Proofpoint-ORIG-GUID: dOtMzLiF9qCb2env8O94SvffBnaCzKf1
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55d7d1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=E5xm5Jb5eINjpAnLFd0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA2NSBTYWx0ZWRfX0gXM5/qvN4br
 PVM2JSotWsCmMGkP3L0JXMyXB3L0hY1KpPthVBFuOXBwvQbB0MG3E8KUYkj4zaVZonvZmsKiQVU
 gnwe5cf6WZ7YdzI0UbS5HMI12Mdq09RW48tyTSsj3I65H9mvDWWwxr1k/T8o9sOoyyns9B2siCs
 xQll5kbdWpH6xnn5deNJr3yydvZWy6KW2UN5ZNMYcgvV7NJ91eje/WfJxj+vypZ79a8XBMH1+X8
 A9LuvZ79eRHedh/RxaLVlf5hkrMOGkIidXR8pwPhHjJQ9T5fQG5CXdZqijD2WaUQx/MgIgK0li2
 L3Fv+Q4l9V2NbyvDXb73lGwS8tOwsI4ESodW8yKt4B2ozp1uNbFcz22iV01V1FLYvIPsBoq51Qb
 VtdJyXmGgLqxdXR9msN/AulY54C16yWoFaY1m5NMjD1yUUK5lSeqdZfSTqmbf/QgPiSnrg9ghXa
 Vg9EySviWDptSHLL/OQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140065



On 7/6/2026 12:13 PM, Krzysztof Kozlowski wrote:
> On Wed, Jul 01, 2026 at 03:35:36AM +0530, Nitin Rawat wrote:
>> Document the UFS Controller on Maili SoC.
>>
>> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
> 
> Why is MMIO address space size flexible here?
> 
> A few previous Maili bindings had the same problem - your Claude vibe
> coding just looks at one piece and you do not review but trust that LLM.
> 
> So again the same comments as other Maili bindings.

Thanks for catching this. Since Maili supports both MCQ and STD register
regions, I'll add 'qcom,maili-ufshc' in v2 to the allOf condition that 
enforces minItems: 2 for reg and reg-names for MCQ targets.

> 
> Best regards,
> Krzysztof
> 

