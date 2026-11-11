Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390149;
	b=qL/h5ODVFs7tJ6UcdRHHN7bnw9QHEZXoOJ8+CIBAP+WS/Ys1PibaXoegQDrtT0zfHysm
	 blXvJBLKAKNpf9WlALciEhXzeajPLUPSDFiVfupHaPhM+BzQe/Anf/QTv+c1D+imX4nhk
	 2ul8RwClQqgP3WK1qKz6Z88vwodnIj+Qs2YkfkelH4VlxK9I4oiAqM6m9OKfG6gPfmodL
	 qukVOw+k40rnWDkOSFdCku18mDieI9BoHODvEbtXBIaiCNTtwVwhiTl21jIlmLD5AYVB/
	 5mKK6pMR/aARy+LIwRj/BGaeAuoxbhudTK9tMMmu7kZ/cqRRserIeu8IAitXiyweg6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390149;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3swutLSFvBISsC5bdMMauSRcUcq6pG/QsuKifyeeuiU=;
	b=ARqPXdaokaF9cHEw9dPbMA8vf8dWxL8mo5/brhQkEdEemIoUD4q2NtcqsGoHLr3pk1bY
	 P8dNmozIt2szI2IqsmYVvBKu0hEBgEDMA/31Di9gJ7bNwtzRJRDqxBFN6uoCFN1bcx46X
	 BCWUR/pIo/h/i3qAfJ2ahwbMjVPAMBXzxfqFvcHRySQB5a0j7znGFiByGpucfDxT7wj/6
	 lfPg29OtZo3YjC6bdSC/vnKY3b46veqynFLODoT45SpeZ4mcp+1+60rmxcG6zItSHtadL
	 O72I5hyeTogu0xOnPv2c5rmh7Zhz35nRE3863lJN9Sc2fFW4ZNDgR6uf+m/t7aodpdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fjJFyaNh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gdc5ItuF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F28606A327
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 09:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50F28606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fjJFyaNh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gdc5ItuF
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KBTv1408982
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 09:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3swutLSFvBISsC5bdMMauSRcUcq6pG/QsuKifyeeuiU=; b=fjJFyaNhFfYeQIjf
	f/cqmsW8Bg4Np3NHwE6PaLnBprrlk5eLPMFsBnLyEFjma8tPaQQ7tuYvQ8Lbiuca
	eIoj7nlaZkqiHVNWaW6Unz6kq5hGmT5QL3Sou8T5UdjQHKoeRBi4jpRoLVTwS8JI
	BBsfZSsLWtXHKl5lP4bwUGtVlRqeSGYWWSxO6CcdF6DLPSo5r3ctdjmWeODPoM4z
	Oc0wUx6M8N7aH3V+fq+E2us+OIcnWqEDkJZHeUW9Rk4he7oIeyZ3D3ybSIOwZjVy
	IUG1OQ0E8IEyT5sHR3EhWPu1ngvuUFigMNZZwwSazKDRxzva7U0ZpP1LC1hRqrxQ
	L9wFHA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdh92y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 09:42:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b09a466295so2528305a91.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 01:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794390148; x=1794994948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3swutLSFvBISsC5bdMMauSRcUcq6pG/QsuKifyeeuiU=;
        b=gdc5ItuFYDmPRwEhgusugxVRHCv4AXKfFTcC0d+uIITcqJ7X2f0vsivnKZxWr6FGdX
         fPx3caqRiH4lvDBNz0jQwW1i4Mn1GRveX8pJ/fqDwO0JrSkEt6UvFMNuaEYVzgaEOm+V
         9w1/gpnGsPRbuFPMplsef79aPeiIbEBTqRvpPmM7KYJJ1RV62ReHhq/M0x7IZHgZ9ApE
         w7DEYc5gvjua1RINm3uKdbDkagM3mLj0Dm9Qh72F/3/MDKs+rZrUl18q8Yb94f6dXgPc
         29xnbf01R/WMhTlLrZo6pWXL+mgMtpNebNCcJCt3RDbEoACDunzuHvf2JqV3SxnDqifC
         Kg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794390148; x=1794994948;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3swutLSFvBISsC5bdMMauSRcUcq6pG/QsuKifyeeuiU=;
        b=ejVUjAG2IBpBB7LpIFhXjdKskozhU8hcpiREdxRzhVFqMlMC6NfgW+BGmWfZgIxzsx
         zNnkEsB/94sEJvj5Nx5lztLxOzUe3A0GS5H+h8cgTgPpv/oEm+kT4hnjV69v80chCUWb
         MbhC6vrN+4GwucxmY9e4PYttAljmT3qEXQbppc7IDX9G4JPv6IH+ohqyGVSJjQXDQsB/
         e4wA3FJJV2SmuZankiEAhcS7TwOycpVD9PGa22Dxv5AdYTwmvxmajkhF/vBypWJgK6nO
         GuVxgw+iyfDj2zrhWfT866ALjpEpjmavUhSy2La2jM/5YJAssGhmBEEe3GxzlUs7hE2v
         mCCQ==
X-Forwarded-Encrypted: i=1; AL+hErHaduJ3wdFbd8QkjxFp2uCfIpAoZ2tltAda09/REx8jJf89V+vCerIIY9MF70L6oxguNm0n9rj3O39x@vger.kernel.org
X-Gm-Message-State: APuU4Z8JVWEbfRehOCN6Up+TguhHi7nWQqVynBSzUIvMsGsAi/RkNKL2
	oR+uBY4AXGvDR8wAgUBpN7Ik68sC5P6D1vgzQWiPpEeyTQJ1K1IfJkS7JDKteXqBUVWJeg+TQ+O
	gGzTN+KnSQbHw2jgILAKFMobjeZlD6ccuuRzxZSJSqHEfxisMrZpxlrIq6Sa8d8EQ
X-Gm-Gg: AYBFou3Eg1+9F1pBgU3oNMSo7nm3YG3XOVEEFD9IneHN74fdeVQCdUBnaNwIrm/wr/i
	LOrjRAsq3pZUY5mEnVu3Lev6EvHeAAbheOIB3BvKJDVRxKKRQhD8JPV6jz6tLm3usa5Po2GeBVn
	1yu+FOO25QKD+H7zzghUIZdt1sMP2WNOuVnKRCkBjG1WuDgNNDX+vDw+3AVtb1f7x9qeqfEUren
	ensB/x3c6PuFJhVe7ka64ujJiXVoJNnscHUH3uyzZYFKpRMr74ZT+BjKeLCYUjQegkz/PM/HqKj
	dCky2ErONRQNGcS3N3KuI1T27H33C5Va0Z3eWZ5fmXSxsH+R5bR9S36b9CQdeR44KU3XhyIQKo6
	Mmj1UNn7IM8h67zCGuNNzKeChhuunCVMFyPA6VG7VUqIWyEypf0+vhrp+k8ErkQf3D6FnSDN4A6
	4uamMm/6JJ5r0o5X55Lj9MSPUpx5FKMYDo6GPJzg==
X-Received: by 2002:a17:90b:1646:b0:3ac:4e18:237c with SMTP id 98e67ed59e1d1-3b182d5e478mr1994773a91.0.1794390147739;
        Wed, 11 Nov 2026 01:42:27 -0800 (PST)
X-Received: by 2002:a17:90b:1646:b0:3ac:4e18:237c with SMTP id 98e67ed59e1d1-3b182d5e478mr1994754a91.0.1794390147211;
        Wed, 11 Nov 2026 01:42:27 -0800 (PST)
Received: from [10.133.33.237] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182e0ecd3sm1254717a91.3.2026.11.11.01.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 01:42:26 -0800 (PST)
Message-ID: <f8911f68-ee78-4eb2-b7e5-1e879224091d@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 17:42:23 +0800
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
Subject: Re: [PATCH v5 6/7] arm_mpam: Add support for memory controller MSC on
 DT platforms
To: Ping Li <leeonion.muyu@gmail.com>
Cc: sdonthineni@nvidia.com, james.morse@arm.com, robh@kernel.org,
        ben.horgan@arm.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
 <20261109-mpam-resctrl-dt-knp-support-v5-6-150335a79381@oss.qualcomm.com>
 <20261109112737.1081437-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20261109112737.1081437-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af43884 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=dT42ApTGJaDrCQAcAPEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: urafejKuRsIBdZDB2wEJB9J0-mzyJwOz
X-Proofpoint-GUID: urafejKuRsIBdZDB2wEJB9J0-mzyJwOz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzOCBTYWx0ZWRfX18MUb7+X+9/s
 KJ6neW1aDO5Vk5hHTp1mGC0t4/2WRTN2xg6EsWD0eqNEwkCxBk5tFEz/fTZ94QZhavg+4T/KYs7
 O4dx7WK3Awoqx06FyWDyqj0z9JAfx03qRCI3PL9h+W+oPAbAmkpBVa1zTebwm4zaUxYOxpktJio
 PfmJTARyDShBU/WbQ6ekA3MtitvqLAyb8HDvyWO8m0DVkprLtR4LSfJV9VnRHA0nHE2G0wSdRIX
 wEv0twbeT6roIgYSzYjPG/KCu0bMjjkRiU+tzJxrzY9tx+IW/O0D1GpPIKKWCOvvXSfR13vPyAW
 By917Yot/Q/jxZod+6Q6wldDlhHZNbfBCM8tzVxY5BsicZSrzJ+wNLRtwwXMi1YsTVyQPhy1nhH
 oy1LK/YnK7kra45yndibFBK68SbRCEzfNNie8bOb6vhWMM7yoE6JPEZ6HnvXSevoQoOArQYvZjk
 I0oipA7i5a/rb/J3Nwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzOCBTYWx0ZWRfX+0Xmd5d7LT79
 Cui1ijBQ8k4ksVYUOibYkO6PUPadC0JGoZqnJDFMsixT6ZtkhIJd0f1SkesnQ2xaOFyrEjb5Lsk
 uu18omNp5O0hBmNa9FXkYu579V/9k6o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110038



On 11/9/2026 7:27 PM, Ping Li wrote:
> Tested-by: Ping Li <leeonion.muyu@gmail.com>


Hi Ping,

Thank you for the Tested-by — it really helps move v5 forward.

To help the maintainers evaluate this series more quickly, could you
share some additional information about your use case?

1. Your SoC or platform name (if publicly available), or a brief
    description (e.g. "server SoC with an MPAM MSC on the DDR egress
    path").
2. The typical workload scenario where memory bandwidth QoS is useful
    for you (e.g. isolating bandwidth between tenants, preventing certain
    workloads from saturating DDR, etc.).
3. Which specific features did you verify on v5? (MSC probe, resctrl
    mount, MB allocation, mbm_total_bytes monitoring, etc.)

A real usage log showing the memory controller MSC working through
resctrl would also be very helpful — similar to what we have for the
cache MSC:

```
root@qcom-armv8a:/sys/fs/resctrl# cat schemata
     L2:0=fff;65536=fff;131072=fff
root@qcom-armv8a:/sys/fs/resctrl# echo "L2:0=111;65536=222;131072=333" > 
schemata
root@qcom-armv8a:/sys/fs/resctrl# cat schemata
     L2:0=111;65536=222;131072=333
root@qcom-armv8a:/sys/fs/resctrl#
```

This would give the maintainers a clearer picture of the real-world
value of these patches and help speed up the review.

Thanks,
Yin

-- 
Thx and BRs,
Yin

