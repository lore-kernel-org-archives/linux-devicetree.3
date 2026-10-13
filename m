Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8657B3F412B
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902476; cv=none; b=V1+B/Kom15dk672bZpfFACKc35EkTkrKBqQ+Gto3JOUe/ioTeJ2eyVYuIjlwffWODNntBIRXiJHJkQ69zDCPCyjhp6bauWdF06jxb0PU4FqE+OD3qhhKL3WvWHIAotpV1w5tevOHE14hEq74Og5GBFjTl0ME0+VQtzphArHuJGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902476; c=relaxed/simple;
	bh=zstXjsOXIwstycTOYzDT8KSr1poySZmNcn2ehdXPKFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FfhODYOojVA4XpWtJaA60KBN/40D8M7gFUurGrGElUoTcva80XILosod+KVeeiLJ9/8t6vyhghRcyfRhDeogKGDE5jGzl6nfeqNa0kf81gGeTkb677+hc50HRyi7y12qu16Luf3ytNSB8VcN3NS1uzy94o6s7zD8+QhM0ojSr9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WfCgGIqy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WfqKneWs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WfCgGIqy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WfqKneWs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE3qod1999237
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wSC0VQWbRfgny7aR7hnJsnUF8s4Phgyw8fzCb0zlJWc=; b=WfCgGIqy/maVaLuk
	K+vouDRW1v9tMEfYrkPB+I/kWR7Q9BYt9SVbfkjM19sbeHIXNrS2+HZcTpKx5KG3
	D4zCupspt2Iei4NMdjTPwqBrl//PK2zOGwkT4R6ddwXYbba7saBWNNVfqKpbre6F
	EvYs13flzNBn54VKFxY8Xe2LKFi+9auLbfv8iJfQuvd2pVIOE2uqnDsLR9QT/y9i
	jsmY8LE7Uu52L/pqY133bnyk2DnmR3UYYZ6lhWIaNRrK2LZincN2aKTjZr046q2A
	eQ2C7AePC0sEI6N8tYujeF/dBFhB0nXawtf8+GzJMwv36lV3Dgvs29CUcBy2xhMj
	K9jjCw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f62a591-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:41:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac58b24so31323085a.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 07:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791902474; x=1792507274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wSC0VQWbRfgny7aR7hnJsnUF8s4Phgyw8fzCb0zlJWc=;
        b=WfqKneWso3FtPxa9xPEVRcfFnzRr/M0wz/Z0IUJI5uZGFuzeuaHDFSCE33d7hHOEDq
         wbfz2GPL28qn7Xa3Jbah49ffhqz9r3Mziggeb0MsFgMQgKZrMAqw38giXpjjuEhqWu0I
         c5C+jCEmv5IeV3im164Md5WWeHd0dU0JOyAtCnmY1RGHYHwr9yAJC0jTeSVzGRLXOp7G
         dX9bGhayA3jIMKuEacuUb4p5MIThuH4yAdVI/bn2KI6DylqBZTTJXv3mnqzMay2Z3RJC
         1GUu6W2cPpCaNEV28VP8fkJNtIWAVr+rPOnNF90ITri2bHJxNCqLVm5gmDtpjObZR/Fa
         MG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902474; x=1792507274;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wSC0VQWbRfgny7aR7hnJsnUF8s4Phgyw8fzCb0zlJWc=;
        b=eDyVVd9pyUfvxTRHpf9hYQaidWUFx/cSKrJtZcR5RHdHpt9+7r+ZQmUxi6PqzGYO1c
         wxOG3JeCDCpcO5zeFF5TJnphOR8PhuW1EUuMcuXc8e5vfa7x/OM6SWOVNXG91gTBqy3p
         iRFhIqhXjwW/eY/o3VypTT4Rh5m/H79yYB5iOmLLqeROGQVeODvUq+duGmmnst7eseFn
         fLmeaxbQBMIdlxSk4LLr/96akjyKm/LNbAsmvHMVc74x+QDhxwUe6sGkadVAPbqGQICt
         1ZnKz54P7WlFbXGMQPiIUS9Go3vK/t/zvYSvHVB55MIdeDXwXAQ5HE/WHpSKdAv5wmiz
         bcVg==
X-Forwarded-Encrypted: i=1; AKwUvByAlaNpIVd1uiHwsf1wXPp2JbZv5Cm+XpToO3pKe8mpsYXM/8zox0b2NbNKUuBcQ6HC5NMMNC4D2a90@vger.kernel.org
X-Gm-Message-State: AFq9FYKf/ZDaeY/auytH7mFyNIhq2ZDQcb0S5ZNtxj0KXx2suOLAESz6
	zYXIpgxpQN8QwRKRIdv+/ScpYPfvCiwQi+EMpkxxqfW/J6TwYi9E8wy/b/aHaYxYeO+13ijjgRk
	ewAGqC4BeTsWHm1YGttbTtsOLMuapnNVF/bv+Zt/x9JuOuLzILWRUsKzT8uoAGf9r
X-Gm-Gg: AYBFou1IDXAv4K1N7hMQ4MbmHcyGeoA4g8xfEU3CgOkLswYhbqplbvhS0iO65UN4Whf
	PyDRfmRLkgx1zrjGrDc999vjPNku4Lr8L8Zdm+Tjgdb/FHITJazYrTPQ0t4ipi3jZpihuWXXlri
	57B0A6aOBwepCu+id2RVCmsPNNK2CZ2kH28UX/8iJszMmPwkvUAux1i9vbFzVwqzP5kNOuhv2K8
	r1BX3D541PfEzk5SDP6Qal3qwNKfzUblRLyewbbbTb9PjHuHhihSAPpchw0u91OtvjNsEzUsA/R
	MH3qIt3PVsN+olJ3Heg4xu/yUGlqLwvLdyH6ePocYw6d054+alBoiIaNA9rHoNoYiOQ1cYY6fvd
	RwsO/MJNGQ8CFej8mPnre8Q==
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1191020885a.2.1791902473237;
        Tue, 13 Oct 2026 07:41:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1191014885a.2.1791902472688;
        Tue, 13 Oct 2026 07:41:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1da0641d0sm1923980a12.25.2026.10.13.07.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:41:11 -0700 (PDT)
Message-ID: <3fff91c4-b831-410f-a151-847ea407acb2@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:41:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-2-77bd3d68d850@oss.qualcomm.com>
 <5cfe6767-9097-4005-a78c-3066a2aef1f7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5cfe6767-9097-4005-a78c-3066a2aef1f7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace430a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=xRnL3yBE-CjZ_xjtVVMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX1/GG/hp3kznq
 NWlZ8dc0Shvux8vVIfmX3XjA4mUtaYDbZ8krqOHqjgeMN7eIzVhJq8htwuAFZGf6iXcwRTHNcR/
 dCc8VZUYEA1OAPzyqBzPEL1PZf07Snk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX+/RFzBj0B6WN
 RycJ1VvLemtMEfhnH/MK7PVkzHgtR6+IRAweiz/O+p0B5UQsMQRmS1jnGhffR/IVYNcIEJQ/5O9
 ENKhMAYWG2wUKuEUD1UyzlDwb8/FL1baINq7tZzmCj7KBUXxCNoro2kNF/37hzJUFwV2XNURqgZ
 PpRR86BC+jtw/MkihlyLhFCYp47t4Rzv+UPN+JWbVK2IGLJDUOELO4mR0sxNmJ9UN2CJxVXePse
 ZXkkHe9qawp492htKta8d0ulq8dhYKPgRGiAqeoYywKtJ1h2PbZbIFHeeSmmjZ+vtW0X7hj3oVY
 6YA0BP6UP690Vs5KLA2P5X08feL74SCD0v+3ry+LLwwn0srbJBSkZWRlT1/gGOlFpZxJ9uhzZhT
 EFxS9vvVzoJJnkeSsiMKPQya6cCNZQeDw6M86qIWfNbUU6IfFBMjDBEzqyc/vFUUBH+Q2U8HYGi
 wpXUjWzeEz0nEef085Q==
X-Proofpoint-GUID: z85FgMaIXyVqbsnWwX0uokj1Qq1no37M
X-Proofpoint-ORIG-GUID: z85FgMaIXyVqbsnWwX0uokj1Qq1no37M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130058

On 10/13/26 3:14 PM, Kathiravan Thirumoorthy wrote:
> 
> On 10/12/2026 12:53 PM, Varadarajan Narayanan wrote:
>> RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
>> share the GPIOs. The board has to be reworked to change from EMMC
>> to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
>> and include it in variant specific DTS file.
>>
>> Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
>> and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.
>>
>> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
>> ---
>>   .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +------
>>   2 files changed, 211 insertions(+), 64 deletions(-)
> 
> [...]
> 
>> +
>> +&qpic_bam {
>> +    status = "okay";
>> +};
> 
> NAND is the only consumer of this BAM. Should we move it to NAND DTS?

Can we enable it by default? (i.e. is there any reason not to?)

Konrad
