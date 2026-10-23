Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737358;
	b=oNAD/fs0xLBXmB3Rsi3TJfGYjC9vZvPFy+SFWHDEOBkXTazedX9KTw1IECvOM3Oz6/8Q
	 /f1sjKR3aztKcXbaHti9UUAlgLWtVgzWmm5MBWPtAJL6I4uU8FNQP54vbPR686cI5Dlc/
	 Mw/JGUuzfsVVL6huzR0OPJnQi/gZmzhQDv1SW52lX4aUSXhjqxNcZ7yCEHDM+M01QxLvr
	 FFOxQrixlU3hWceMf/ultXo2yY2wtZU1ZeIYFd/5YYGbmExTwx6G9G57SDUuO2QW/VdH8
	 vilTB37u0Pqbxxnrdsq32eqci3xcYI1ZaXI1qfc6dl0y/7Hz+14PfXr0SvOGpgJkblQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737358;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nQR08uFswNG3btoxWUtA3xdkWmg6sVlnAnw71YgawmQ=;
	b=IGBwtlAC4WfA7+vsgGkYFl1nqYrI7etsn5AO7xpO6s9oHiXsCdNiJAU8ChAGThgHM1+R
	 /6WOZfDs9FOS9Qi7dAuDL65TZqbh8zc9WoAnl+/qeIQqUvIEMy+uZ+n+zUWWweMdwOmrW
	 xZ3XOlEZyvj9JHJTxfgcV4lBdLjBQoZvqaKTCYzVWzSuxVJiwSXdngs8fOMuRsTHcGZRf
	 pVai5q3Fx0sx+KzJKRMDcg+LrLoG5aZ2Dr29QfRYC4qAKdTUeYw4YLM7ds3s3Muho1JP3
	 q4a0igGXSiO7Eb62x/tV1i9GxrJWvhmDwGbzDp/EhfDrtSnN9vLN1juaOwnOdSAU01A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aSfuX03Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DCCE71Ck;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412D4606A31D
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 412D4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aSfuX03Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DCCE71Ck
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FqLP4008303
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nQR08uFswNG3btoxWUtA3xdkWmg6sVlnAnw71YgawmQ=; b=aSfuX03YfS+94pFv
	7plch/SN3ozY0zca1mXWGPSdS3DaJmoA1JcxwoAjTeqEilifoP+0UMqWYms5L/5I
	jEfZw/bSM+bto/WuOO4pLtU4erDqhrHw/3Fgt/u6tseicUkIIYM1lK4hcLG2fupW
	nL1ZUtv7mrFzGSpywQSImgTozvUv9WFf4bFPaGpZQ/ghpa+wtmi+YZaZLLETO+JQ
	3XOzidkr68huM+J7biySdI4ZK4/MLMwiA+/cZTAYi8xMPmv+aliXo4WLqt93C9sa
	YlWhXgt551LC/VfgAcSsBAME/8fwaugdlWCyPUepAu8LytVA6mBpk1bT1/Cidpd0
	3LF6fg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmasruw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:35:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df375fb9b2so5765605ad.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 23:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792737357; x=1793342157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nQR08uFswNG3btoxWUtA3xdkWmg6sVlnAnw71YgawmQ=;
        b=DCCE71CkyvVIO+hC5WDyWevOShxzDY5Tc8FjJClpH5ulJ4IZjggRDF5fHPWFx46n1U
         fd8IgTqaEIb/jM6j2AbF9zx+jk30aYybvRFYC1sRkQOBrXp4OEplv1tpzsQOcpP/GOeV
         k3k8pS+slBMyETVcvVQVgBvWJRguWDd2Oyztt4jI+CpeCfG3ucRm4OSi5+/8e0E6q39S
         m9q1ulvwY/KdNRcgAbwy9a7M6olvqyIond/0em60VrXRfQBz4hWfp3Rz/+7scvqxl8L8
         yNWp6wW5LEe4uZ02GxK2munvxo91T/YYNJv6yihHiJCJEASZUfWxVrq9tO4TvFk4hjtp
         xuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737357; x=1793342157;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nQR08uFswNG3btoxWUtA3xdkWmg6sVlnAnw71YgawmQ=;
        b=i3nT3SWfBK+ag8D5eW20bzrO83t6vLEAXdO09gG56PMfEymawpYcuMkxEJY39u9FxJ
         M8/zGennEB5IkHi0BgGBiZZFCGXPCSgLahlpJlncZpWML0NhQWnBrkbeIN+2NFz/QmGx
         HTmUfMb3f1BIa8tEMLwM7OiHF54CIGbC55hD8brJ3k2ozqHVWaVEh+32Bdjhkt3iLX1J
         SdWitTEeIc9HCjSo24P96NUOiEQB3+3iwyqh11EHRgQ7R/1BNVECK+kH4GRc3MSw60W8
         v4PL0LGuJpnlArJyboO1Ia852oZuse90rdsG4UtMTB5XJbrW/38PFMGzvk0dP7067ORR
         YNnQ==
X-Forwarded-Encrypted: i=1; AKwUvByGtlriAqbSx9G131NRBPpsiP7ONRo6uE5q7qsm/DOY9aEBdJPwEPA0zveSkUHfGuf61moZU8WYY+oI@vger.kernel.org
X-Gm-Message-State: AFq9FYIpLt8La3/EQEKa4ksVydlChTvlnYojGzz+NTe5Ln0XohtXkPTx
	Ten6Tk/LuU85LlvPY7hZtESC9TNYBEtuLSWL8sV4nh4mh6EVgItL4wgmCxn8p4j2fUmVxaUtnbJ
	PVECObcS9bqA4AsLPEx7lE/WQX0gn4YfdF4LFGn8E4xdh1XgDq72Eo+7PbUfLEwxO
X-Gm-Gg: AYBFou1C3LgJV5AaXwAbONrVWpF4RVZ95JZVpaFdEJHqR0KB4+OBp+YR7O5StH29Ez2
	OCjLs4NF3mu9uT+T3QJvT1CoocZwOkhaYaqHmg0nD/gd///IAwBXdx93V6f4gi9WA2b9x3rPkge
	W9LFMnIF2/qqgQD9SLqN1xUFaNJJ1cde/rWBNa9E3yvi7r8mE6VoVPVHX7g6L/JP14U0lN/DHB9
	bJ4o67C1rdynUJGrD7h87E8duq3ca+voSlfgIa8HHT8yD7FjAL8vl8zeCsAGEiBrtQO+T34q0LM
	nizoogJTJIxwjitNmB+Mmv/eq1NLRGMIAjFneQ+16BhY+AQ8HLN1RfYnu2fMLJGTR1o4iw+Yj4z
	lblZtyrKYTjR6swZHURq6M8Gsn5ricHbK
X-Received: by 2002:a17:903:4b47:b0:2df:afe5:56ab with SMTP id d9443c01a7336-2ea7c2e93b8mr13960815ad.29.1792737356569;
        Thu, 22 Oct 2026 23:35:56 -0700 (PDT)
X-Received: by 2002:a17:903:4b47:b0:2df:afe5:56ab with SMTP id d9443c01a7336-2ea7c2e93b8mr13960525ad.29.1792737356123;
        Thu, 22 Oct 2026 23:35:56 -0700 (PDT)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b343d1esm6107115ad.23.2026.10.22.23.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 23:35:55 -0700 (PDT)
Message-ID: <adffece9-165b-4576-b111-6aa40a443734@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:05:50 +0530
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
Subject: Re: [PATCH v3] dt-bindings: dma: qcom,bam-dma: Allow memory-region
 property
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20261021-qcom-bam-dma-vmid-ext-v3-1-299355e8dd3b@oss.qualcomm.com>
 <20261022140139.GA952798-robh@kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20261022140139.GA952798-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb004d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=P-IC7800AAAA:8 a=07d9gI8wAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=9ErL3UT9lRrTfhtYDI4A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=e2CUPOnPG4QKp8I52DXD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNiBTYWx0ZWRfX8o05m/cLqpsq
 H7QQ3YDuPu2CFHwaSgjrZwYYTyqltctPg69Q7mTHh1WgerGWnAofCeswinVAjtEhkckrPD5kg3Q
 vIqxP5G1NBFTTcVKaZVxb+2yT7U2WHc=
X-Proofpoint-GUID: W4b7I4tpsJ02YYRQzXgo0o0kGZFndTlj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNiBTYWx0ZWRfX6IuNo0gVwF+u
 FTj1ohVjq8cvlJ558jby7Z+orySuI5ePaLZG9uLx3KrfFF33FnE7UT2TySiXOnikuJtYU8iAUfS
 hDBh4fVpAdDNnXGoviY3vSw6iVMGCDaxtzDOrFRQ+PBKzGEWERxhKaf6xGt1HJjNqRBCTAG3GDM
 11mxAaJe6Nz5OVR597kEm3u1AZklYMoNZeyWECXsOySmOoWfV+Ad/4+PnAw2MyI9wyzWq9/ztIT
 xhEqreNcgKKlK6buw0YuC4VDMpkLmnYL4R5YU68t5t3EsV1ETCQTNjQzYeymjjUVw6fjYGAgb/J
 jogD9GG4dSCFKhMzl3CG5pv0IlfbLQHRl3oU2g4IQYPaZvg1hRM83CYWSB2ibbBzOL/yrzA6wFg
 /65FAXkexjzTI+bMqtbici+/kmQ+GBbCEh86QNiiSSWo+VSwOO0PvzQrq7WVRtBRICpZTl9xqJi
 HMhXhqO+I4k0UiL1PQQ==
X-Proofpoint-ORIG-GUID: W4b7I4tpsJ02YYRQzXgo0o0kGZFndTlj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230026


On 22-10-2026 07:31 pm, Rob Herring wrote:
> On Wed, Oct 21, 2026 at 11:22:35AM +0530, Vishnu Santhosh wrote:
>> Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
>> domain, preventing it from accessing BAM descriptor FIFOs allocated from
>> arbitrary host memory.
>>
>> Add an optional memory-region property to constrain DMA allocations made
>> by the BAM DMA controller to a restricted DMA pool. Access permissions
>> for the remote execution environment are managed separately.
> dma-ranges is normally how address restrictions for a device are
> defined. Why can't that be used here?
>
> Rob

The constraint here is access permission, not addressing. The modem can
only access a carve-out that is assigned to it through SCM.

The soc bus on Shikra already has an identity dma-ranges covering
64GB [1], so there is no addressing limitation to describe. dma-ranges
does not reserve memory, so allocations would still come from the
general page allocator, outside the assigned carve-out, and modem
accesses to them trigger an XPU violation. It also applies to every
device on the bus.

The A2 BAM on Shikra is not behind an IOMMU. restricted-dma-pool
provides a dedicated, per-device region, which is the setup it was
introduced for no IOMMU, with firmware restricting device accesses to
specific regions [2]. Stephan suggested this approach on v1 of the
BAM-DMUX series [3]. The BAM DMA controller and BAM-DMUX reference the
same pool, so a single assignment covers both the descriptor FIFOs and
the data buffers.

[1] https://elixir.bootlin.com/linux/v7.3-rc7/source/arch/arm64/boot/dts/qcom/shikra.dtsi#L508
[2] https://lwn.net/Articles/841916/
[3] https://lore.kernel.org/all/an27PVxkCpD09xSR@linaro.org/

Vishnu

