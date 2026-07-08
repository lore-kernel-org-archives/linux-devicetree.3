Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426703DDDA1
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495752; cv=none; b=PDdLifYC6OLeDUDMEDItcKpDFefu2ASCr6SV4gUTp1HuxG2JhbY+NpHfCiwjEA2mDrB1i284EaV1RDXPoO+Cs1ENz4U5Syo4zTE/UeDWIS8O8Q9vBuxlIS4dmM4/tdLkXnIFXuAeWwT0ZILSmK+T6JgbVYJrxK4ZQxQiRUAZuWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495752; c=relaxed/simple;
	bh=Ugb0YDtHFZrdU/ufa9BpgTebHed1Xy+3F4Qxx+d9MZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HF9txNq7oPPXpdFrfz3Cn8i9Rx4UmG3aUGGXlYdXkfQcni8YTgzaeFH/xow/uIWWqm6LXUaDmJd831kWOEU4ltdHkVy8/Zh7RPf4EP4wy1hWyus+K3OKwzGF5OLVHOJvQs6irRr6JI8v/J1rwlDVGlfse2f2K7OlVmwF3DIIL7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XTDKM/RO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tiv98RjT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XTDKM/RO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tiv98RjT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842iJx1625097
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 07:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dvh5gJVY8//gKF0mr/H5qtFP7jMpQbhKSM7yYtQ3njU=; b=XTDKM/ROgQW88A9J
	4ceQC92h/kboQMOd1fmCWfZ8IYSXbZ6/H5KiGZw67SckXZuBdjfdOO4qfryYSD05
	n7d5FYscK0bC86lRG4MltHZvMaKBFeaQ7fCFg/AVfRho56byqzhHPvzf84FkzL1p
	wL2HD3HogKNLn4nT2wlStHldKeBn4DL4ncu+8/lpZCtpMWiVsw8QJybYd1duVr0v
	eu6V+Tu8Ar9q6QqY/JtvU6iEe0ZHhevwLgyHTtH5ArSC/JRkFCrrgyO6XfrYpV8x
	TVoVmqW+8nd1b2I4o0FatWOgO6JgABsjqL94LFSkIPpqNA8HBQwZxz7a4XUAyh3j
	+g4PUw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd38n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:28:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c9a700dc0eso5198685ad.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 00:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783495737; x=1784100537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dvh5gJVY8//gKF0mr/H5qtFP7jMpQbhKSM7yYtQ3njU=;
        b=Tiv98RjT4OW6m8gu6Zuf/LORu2SEB1EWZAnaLIVxK2WDrYnek6oNLPOsZqyeXlK0ZG
         gnWZa7kQLhsTlgVJ+dZm23+cFLgnV+wnJHfvjYRImvXd634m/yFQOHXnZEGzv4yv1dFB
         EFBx3Lad4wYTFdnLcEHNEy9+CbDIA7x3WcdElTED8AhWPnDp/v8lwG4v8ZplN47VXFUh
         syX6UNYDPXeCIF41dKYaLJYCfe45LqhlcjIYAdjvQWTql4pEyXhFNnWr+LKKS14409GY
         h0ncYTkX5x4cWQ2nWnlFpyLeNKLrFc5emK27UMZT+z2ecTNGjnyoXzAvOS6QXBkBnYo6
         ognA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783495737; x=1784100537;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dvh5gJVY8//gKF0mr/H5qtFP7jMpQbhKSM7yYtQ3njU=;
        b=WWuxa/04yh6x1Iw3m2f+dtEp9UV/9fwDlEOLs2ZIpJfB9YFEWTrEIr2VCNDXB+E9a5
         wcZkxxme5FacZKGQrGHo4ZTnX2s+r3MDw2mOFp3GCJtemQHPhQN6bXUwD7vobWmBXjy2
         85nFkKzRhxQSeWLUm+Oo34LcIJnGftVthPlyMhI1qhtAeMRNGatgZadIYdEMTrotUGXF
         NA/dSc8C6pMKg3sB8SAkYemjae+AFImfKmvyCAnC77xLq8p6L353J+R/MYRzPC9A8njs
         mHJq/xy5QLh53XZMEFe+a9MlksLVGtAaMtTgxVigonhCXaTVWPOElBEgbjhpeEavqfWF
         v0Dg==
X-Forwarded-Encrypted: i=1; AHgh+Rout4Yrzck+BgK+9izElPjUEXVQ9IHZI9CF1bmti4GL82p285ozlA/a15wcq8qATZfmiOONX3pZqVDY@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ7pJZrkASlY6dXcyXF2VtXWcxQhnBCp8xykta0bx48cwY4Wby
	JpaeDB9AXwOOn32ySIjPgy+gpeGqhS9aEEwGG+VSA/EjA5LWtUI42u7HKUVugFEWyBTsXjPFqbz
	6jW8tt+vYsNqM1keLbdRyAJfdGmAlSDazHnoMawDLgBeLlg824ruxnM/3RfOy3nvVZNm9ioN/
X-Gm-Gg: AfdE7clIG5NwnqI3zyVk/fBUshTrBovaeEHKM9WYXSOyd8Ex8MDzUfj9X0HgFxmn4dX
	tziel+dDpwSsnp0ypa8jZVlubpcAN6c92giW0tMXNH+2JCsVGlREM4zQb+mq4gkF7iDQZ1X8Z/Y
	a8GSHXi7VQK0vx7aXAM6d07MqU74hOsHffX3zRjo2TsYrQ8MaVpjDujPAJEIdzkuKSwLGBdC0vB
	uB5LkqaK+HEgUtZNiGsIhrw+wu7hmvNTqHZBaGaG4GLoo4kV+yEubickIsqbGT64qfPzzsDw/Rn
	B6wrpaOKgt0Fa/pOcPL/0n48083ONfRHj/JvEaU9XXVYeuoYsDlHU7IOrGSBYDb8n9IrQjvyq9N
	nZmx68aeZnqN9UJQtQD3WwliQVqxwh+gUuF/luQ6tHI+k
X-Received: by 2002:a17:902:e950:b0:2ca:ecf6:9104 with SMTP id d9443c01a7336-2ccea384155mr14778675ad.4.1783495737344;
        Wed, 08 Jul 2026 00:28:57 -0700 (PDT)
X-Received: by 2002:a17:902:e950:b0:2ca:ecf6:9104 with SMTP id d9443c01a7336-2ccea384155mr14778405ad.4.1783495736875;
        Wed, 08 Jul 2026 00:28:56 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm23834915ad.0.2026.07.08.00.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 00:28:56 -0700 (PDT)
Message-ID: <55298d53-9609-44fb-bf02-1d2e8ee03635@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 12:58:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dt-bindings: dma: qcom,gpi: Document GPI DMA engine
 for Maili
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260708-maili_upstream_gpi_binding-v1-1-e48cb7e216e3@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260708-maili_upstream_gpi_binding-v1-1-e48cb7e216e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA3MCBTYWx0ZWRfXzs+IUUA7UNae
 S1oYAgBwnbVYmLdZDwMQBMdNKSu9WN4sgm+T8+ogZjuEOzK80MMbRp6pcxy5K3fgMhfRCKWBkD1
 rujwz+PP6GweWfm8FiADch0NK9rYGPOyFvtvwXnAX0m59JBQ97ViSV6svdYRzRUdItBXEu2Qm9x
 kde6DQ8a0XiDzvFwxnVjdwyEwXbsHWuTID0/JBssy8OxqI7rVwRTFi0aeSB8yiicDTnaMWUFrkz
 iit3Ner4qW99SpAXpibiFHhOc7tB5b60hyOVXjghe+it674ndaNHjtRkOR6KRvjC8VFdtpH6+R7
 /35SbL6y4kRFfgANV+0K09/uIPRRt0Lz0Duyi/mvNHAibOY2VuNMMmziUrRWcfl/Dcn/4ZYPANO
 HwQmtzNCzGcrz7v/2HlqqiENUaX4UMf27QKwSc6Z9od7UC+Zltlkq3Ir+/QonhpNhKwdVQBdCI+
 bd1Ds3RJJ//pCDGOv3Q==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4dfc3a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vY-R0Ho-sSes-qxfqNcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: AOGllDca6J4WllwyL5aYlric_bIaeYPJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA3MCBTYWx0ZWRfX3VsTIxHo+AdN
 KNXEB8b1fJa2eo/48onTYhCIxNQ72/bHxqdn+f/m75veqy4SsbWBePGEvZAPPCpttYK7ItQJh9k
 Hoeon4j9EkK2A4IzyHfOkFSX21s4OUk=
X-Proofpoint-GUID: AOGllDca6J4WllwyL5aYlric_bIaeYPJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080070



On 7/8/2026 12:35 PM, Jyothi Kumar Seerapu wrote:
> Document the GPI DMA engine on the Maili platform.
> 
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 

Acked-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>


