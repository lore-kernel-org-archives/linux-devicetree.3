Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F0F3C415E
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790229683; cv=none; b=tg35V2dVqluncU1yVFxNVfTtKg4/SZ49L2DWvZe2wEUitgzeGcWZNMfjvPBAfrYF1T8jHhVP6CBAsHe1LbDZ/W8dOgNqNe/KJF8YvaOBg5Xl0RZJObbX7HJT6JFFZJ/rrjORpHPoVeSd59Vkh2ejpILc+C10HL64RlOVenTF0KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790229683; c=relaxed/simple;
	bh=sZH0RG9xYYcnMn17IqWz91Mvah4dkJO5Tvq7b04DPUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a50c+F7UnBugWtxQFaLKl/Z9vwhk3Y/SNRrVf2HmS0fSrmOEGCSdS67E8D5C3Ml29tGH69P58C+DiaJE+lVb/RYIviDNOzkiB56vxY8dKuW93dLYSqe66B/yCH2M4uxY08Bi+h6HPauPZn8Juf9At7waKH1U5FOAPCam2kIJHZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OyPyZurN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JgZtJR5+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OyPyZurN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JgZtJR5+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eQMO1532428
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	36SCu595fBrAhzUja5qO5b1ec1y+vrmrZIti2coMSts=; b=OyPyZurNVLfEgYX7
	baIy/TY8ui3COJ1XpoQJJjMyEFxEU0uoY9zx8zNH7KrXnIqBe/eRJISRLj6O0WbB
	HdwfGHemPvsozsij7TzrIX3gLVFq6OQ778FFMReSHE1Hb1sgdrNg6YuVy9G40x9X
	uaD9A8gVSAZCdU124e1z2QlxNKehVEt99yXwdBS2UsCuyalZAjFnIImc72x68Ud0
	xP6J2qQQmnHBZa6KGB5MUfr7KRISJ9LMnzXbRpaDsSORs+2G+esEvtFzVXf17Vxz
	7SrjtHMYLC1Pt3tJgfGJYc+4LwFSz789AQQ1pI54Rr8ZJWORaYDzttrsSr9PEoBX
	nLa8zg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvsfgrwdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:01:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so3843812a91.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 23:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790229680; x=1790834480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=36SCu595fBrAhzUja5qO5b1ec1y+vrmrZIti2coMSts=;
        b=JgZtJR5+oqtleKd8OZIVM9Ofywn4/eoNlKzBC9XzsiKeezCePtyducTSIuE/gVJY5N
         4laLnjD6MTT0y+iy/2uRAkd148x3Yhjj8FD6zCp32JO8HvcdvLo8H02zUZtpsfTYpLlt
         OAu4obdAJvwJcKLUt2GScj4Mbkrq7Rk1aj+NA9h1Fr46mzpS2FlA9d/QlwdPS/KzjcIg
         D3dX9058Y1pIm8K/6/OxzJIPjP365qye7rKAvKiilwPOwrri1S3q/9ozQtOw6WwVrEnw
         H+3XVGGN8NKyqGnb+1kdVRvAI3ChrxLn5isSUXY5miew4lkRq87KZgWOfK6vr+ogJNbD
         ED/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790229680; x=1790834480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=36SCu595fBrAhzUja5qO5b1ec1y+vrmrZIti2coMSts=;
        b=17vA8IsCzeiLST7L9B6r9YbAenKS3AHdBmNpXFb8bxBZWQT7r8cnIS+JPdk4WsPPIY
         him4hDdTTWzmPkRAo8tu5n8hAblqF/RP7Lk8AQ/MhqdBwG1QDraFu5b02lCwO1N+o97J
         FgAFurp73yig6lzA8VFntMeoBudAv2561RJ7Zh1/X1dfIUOOafm1pg6giyMOv9rehJAJ
         NNCkYJ37MJdiICFKG+5Hoig/OVq5KFXIpB15Wvlz2RybqdcdjVzy0mM2Y3DwsSzTfrIR
         TjHVfq9wOV9TqDttI+0WOD2ITvbS26rGeEB0IhnzAdVefJ4d/E+gKffsbrPExKd6xR03
         YJHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaWS1U2GiJvfDYohtrd5HMemO6UJ3hc6jvoA7+WInadms0OWGcBDcRnYnmF13IPQHWHiwDOsw7hQlH@vger.kernel.org
X-Gm-Message-State: AFuF++llv/vS8/PwkOcI1Z90UuPXzZeUdgeVqayYcnqRHQzcI/Z15XGH
	IqKt3UpIDuD0T6V7PjA2RDR9eLtWms0WAClg3QzTGokxdIaUmnKkqNMMmmhgduZ4FZ4bJQjjb03
	XEFflZyaf+NR2fQGiIXEVSe3/Hb7pqFfQgVIrEJK9x+5DNrDNQLw2uMZX1BuSci2sgsarXXot
X-Gm-Gg: AYBFou1diANdGWt88UHkM6zAXNRdfKj4/kiGxUWuffkfi5t51bGlvIvCG3sSDtsojzY
	EjpuQV3UPgOJq8l+sGSqvSr1T2JUGESMB1pq9Md9FxTz5mIa2fs3WJke+NV0qXhABEejzC9MjRs
	7r4tctyW7/5cKX7D8Umv1N6MzwdsPHH9s8NmEn21Vuzcg5wH+B0XbTg8dCn9VwwBEq3npV9xSd4
	w1uI3Pf1FSOZe8aNuhR6OUXrgjmW0F8isohfxhmloZQcr6xxFZ7+qDRV4x7Xg1OZZtKmmdz01kb
	251pM14rlaKRBnWpLjuSLjSYMmszTuFVpYeQYbmOROxA6NN6lEPcJJJGW3B+x/dlyItPs/vPgBj
	ul5cHcL+3YB7Y5qh3/BrpQ0+qcoM=
X-Received: by 2002:a17:90b:3c0e:b0:39e:4c81:6c95 with SMTP id 98e67ed59e1d1-3a098dbb040mr1336696a91.27.1790229679591;
        Wed, 23 Sep 2026 23:01:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0e:b0:39e:4c81:6c95 with SMTP id 98e67ed59e1d1-3a098dbb040mr1336662a91.27.1790229679096;
        Wed, 23 Sep 2026 23:01:19 -0700 (PDT)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09733f48fsm2861152a91.11.2026.09.23.23.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 23:01:18 -0700 (PDT)
Message-ID: <233a246c-1cb0-42d2-b752-aaa208e1ffe4@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 11:31:11 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 05/15] media: qcom: camss: Add Hawi compatible camss
 driver
To: Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
 <-SfKe1h9v_GKikJ1GpSP9vCzngJ7rE-jLyFCc419KBCuxpKK_kH33Xd65VtCIyoH80D_SMZP306pJZ7aKnpxdw==@protonmail.internalid>
 <20260923-hawi-maili-camss-v1-5-cbbb42e534ef@oss.qualcomm.com>
 <df6d93bc-b0c1-489f-9ca2-7de4d355ceb6@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <df6d93bc-b0c1-489f-9ca2-7de4d355ceb6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YfoodARf c=1 sm=1 tr=0 ts=6ab4bcb0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=1yR11Y51etnruO7JmzUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 5MPgt1aNe965pr0VHfJ0G34fCV7ZmGxR
X-Proofpoint-GUID: 5MPgt1aNe965pr0VHfJ0G34fCV7ZmGxR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyNSBTYWx0ZWRfX+gvJ3rkAsSVu
 Difsi9mWpFr4t9ZXdzahZKhPWk+kQ/ybtmXPE2QAUTISSXA78TidgdA7GjBPbjH7zyqPjwlh0Ps
 zXVhB2c5tmcYkg7/XVgG2I67+tXYvlg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyNSBTYWx0ZWRfX2M2Too/hfHhP
 OykDyarXOjTCKoI/J4yW9rHtfpA/lL3k6/vLCi1aYNbIt8EGM3S1b+rP8IGIc2+vgO+CXQ+be3L
 u7ddhvGZY65GUxosRP4sm/6/VHhuv1dnaPm4yYo78VAUYOx3xGFWoU+3f/ng9grL6faSFuEWiNK
 VirXOqMzcJLfBaEF3KKu9aQ6QPPjqJCwSt+nlco2/dmwEVcdxLVNjsR/TK30w1iWyrrBAnNHv7S
 MlROBcaKzT6jMgLQxExQTPl/o5Ho6iFNBE5cp1B51ZLxJxZvqy4Wi0L8tApsAPI7os9VOnvaHdu
 vFdfpI4+UwAX7AXoq2W65X+VES2mzB8DFBl95LiGnSb/lqzmeIM45D1B0VUQxWJNjxlg5vCOZpt
 JusTv/tWdQi49XL1Ce155iDRSB9E7KAtx+UEUSIKK3PgNDhoRuBlACw615JmU8RV5UgWs4my+rM
 njYkgVJ9zfX6hAaiKNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240025



On 23-09-2026 18:00, Bryan O'Donoghue wrote:
>> Add support for Hawi in the camss driver. Hawi reuses the CSIPHY
>> resource table from Kaanapali and the TPG resource table from
>> X1E80100. The CSID and VFE resource tables are Hawi-specific.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> 
> Missing Co-Developed-by:
> 
Co-developed-by: is for authorship only (submitting-patches.rst). I didn't co-write this patch —
Signed-off-by: alone is correct here.

For patches where I actually co-authored the code, I've already added the Co-developed-by: tag.

>> --- 
...
>> +                { 0 } },
>> +        .reg = { "vfe0" },
>> +        .interrupt = { "vfe0" },
>> +        .vfe = {
>> +            .line_num = 3,
>> +            .is_lite = false,
> 
> You should only have to set is_lite = true when it is true.
> 
ACK

>> +            .reg_update_after_csid_config = true,
>> +            .has_pd = true,
>> +            .pd_name = "ife0",
>> +            .hw_ops = &vfe_ops_gen4,
>> +            .formats_rdi = &vfe_formats_rdi_845,
>> +            .formats_pix = &vfe_formats_pix_845
>> +        }
>> +    },
>> +    /* VFE1 - TFE Full */ 
---
Regards,
Nihal Kumar Gupta
