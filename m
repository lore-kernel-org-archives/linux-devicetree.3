Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260464;
	b=swAz4obNwh+JM3WL/zEo3O842EeS0SyHa4PdS8GmN/nAoOCp4TeaqINfNMxOBMr3+bGK
	 SGickJIEmtwv1tIppxAn2KUMjw5oIdP1asJDn36PcuAbU+lz9ccsfgcbDg9Z/LCtvoqkp
	 l+jYviEOt8Yz+ke1V2slujvtjK2rwE+29jXNB5avH4+9kg/LoGPUgDFROnQLeNCPW/T2D
	 uVWRrudFIWNj+Ju/eLYg6dlZYVh+S4UkY6gsZg0h3Z1zMNjW4xKj7briaGhloSzYqUL/5
	 Vfs2R1my2hlTv+Lp9qxsWaDhky2YGHzzG4EB/ix5ob+acNTPDytG4uEdG389dYinwkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260464;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nc3TzyXMoGJC9UyE5HrL9w+JlONNvlln9BnUy6v27Ro=;
	b=LNX7a4UwkC8iczME7EkuNr5VUb5X/k7JQzib7V0iGf+XjVqKUKODcMS22HA2j44N/1Dd
	 XA0fOu3Zf55CJ3yemSzajQ5JZri/Th6MaTSNECN60JoW0TzSngdOFCAiUhlpNs1OuwtFo
	 IEXy/CUr7ZCHcQLKsP7OsCwMqC7tV2ZtOnSpaLQs2wMV0c4ybc9AcYrOYYnCbn11Djf8b
	 3uy4aloT6dA/WcDBRE+/d7f8pbvM1Yd8yIqG5POSSGb5YnjZzMnn9RUcxq3ZTjYwjZbfU
	 GnFnjlGCx0JvL6c09jqYqDN7ExFBd8TSTDmtLsO1TVf9Munyn8mPbJNzj8Clcb9N/tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VwSCCpdb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A1z8N54J;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AA0606A339
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 21:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5AA0606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VwSCCpdb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A1z8N54J
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LAIrg1352247
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 21:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nc3TzyXMoGJC9UyE5HrL9w+JlONNvlln9BnUy6v27Ro=; b=VwSCCpdb+5zHIgyo
	+Bxe81Mk+uvMyazHf8ErYvn4v9fSiBZeM/u3UCJ+OSNqepR3/wr4818JrMIbzYcQ
	R+eJVaz2KZ4QJqLVbpV3so8+c5M/RsXcATSyJKan4wDotF19agsjLnbizjVRDTDG
	lD+pGm6BqHEZ91DYiC77+OdTDiE2/llrovvp6aoJXq37pbF76h4ldRhyFBw6Bd9g
	Cz+hG4GzVWGBfvxJuc81pVxtkoOB6zeg+G9LnNaYmJK4VPnhepfPN/SDgON7VHk1
	TdphtmBuwaGIsJHymSF0ehEi9gb5NzQEs0rLIfhRWb38u0unWhu7hBEpO5ulBSpg
	B+Ks2g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucapac68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 21:41:02 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so2132868eec.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 13:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794260462; x=1794865262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nc3TzyXMoGJC9UyE5HrL9w+JlONNvlln9BnUy6v27Ro=;
        b=A1z8N54JZ6Yo78bfoVBK0cma7Tfx9J1YDKGp7dLTNj4GfhS8V0WTxt03FzjNrRErmE
         GAJLqHliNX4m66JpbCmGr6iKYjYfyhMyOSdbzebKHkjRYNvU2P9WIStdXbHhp6DzJgD2
         hfUL7FnFCgUxMQYLAkmGr2izrfQ19vcJ9f3TeBJgbO/XUVsKm0Is9WmPi6DkbDl5aA/n
         l9R4gZqaKx3ZAzbX947cE3y5PNvTvs1SpiGV1NIwA5/MtLA66MbEnZT1CHptY8bX0ABP
         7BjTdUSEt9tPEXuxLlXkX3HuNTuC6Wuc4KjkPe+QHseHOiZ0EarDOnVz6NOcNTY+HTim
         iJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260462; x=1794865262;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nc3TzyXMoGJC9UyE5HrL9w+JlONNvlln9BnUy6v27Ro=;
        b=eYPt9ZDot/PlyBsaQ1J0nNbSTXO9o2LTRqb22KcqApYBUriJKC7TgcQJDGk00IpOE5
         2skLfmfJBxIeYVdeOkxABl9h63hTElwZJDVb1slszlvjnwsCNzFXwHEji0HJPwceVaS+
         DzxK9n0ezd8OU/8asJG/YTsAPRscfiAM4puhb2Q3Y1HpyqZa0WJVLxV0e3weWZ/HCRT2
         qIkF6kfP+Vpbm3Nr6EyyNOFZq7GARzsnnJ0+ZWq4j2tCFGftiZqiGQTvFDK5kQspIUNU
         ZZYIKnTCL+995m8i6RfZ1zJeKkdrdCFt2ZzmV9/wEaYJ0uL5js/WJo3OF4uvWkNp24oJ
         82HQ==
X-Forwarded-Encrypted: i=1; AL+hErH/SsW1bYdLe8A84QSPt8BRgFhKEY4t0EEqjQD9vC9Cqi3xcblvQrgp+eWTnhPDxx7WAGCP2SIlennq@vger.kernel.org
X-Gm-Message-State: APuU4Z+rYvwgRbaHAUr9m3ngmEguyGLqBEP/aya7mntE4FQzKKHu/5FG
	su6n9STAaefQevzCjwQHctxkiiU+COHhXszWro7p0aeLfy018XWLn10JpJGBKgJpy8XE0sMbKxi
	ZoohFqPUzSWYhPkzp8QTr3xm2Ii63m1HYLeAcsTyd4H18RpsxC9rYF/Nzejor9JGL
X-Gm-Gg: AYBFou2pkLQvNWCgqxdF7S0L/SM0x1Hh2BmrzgMlfdBBqzpF8xsAo2JjprEhphjlCFH
	wHESQp0VQbC8Y/IUJOmkbKD+hxTVbVZPf7xKD5r7bRTXovccRWS9x/r2CrZzX65R64S+DMoBNJv
	Z+ZPm4QktJIGp3XeVf5GqNz05RdJBtnF0lruq+TUWms5f+dMHqnxfJ9F3PkZOoHmXPZV36rPsOh
	6h9q4oNVk9bzu5CGEf6T+VQazN8MuGv/tzzk2jAoDelETiUd63vAIEUq3dhrNGnbGmHBLN9Cz0u
	Q+pKZNJBboEwcbqiAfQMVRVax9unCtgciW2qU6FE3Zh5ntsAZ55/jE6VLR7G6KttBH/4oj2nJfn
	Yx4kg5zbxAIN43hfU6D0RPZHzgOmEtc/hTMGctE6o3y7yMf5Bw1LMIebpv8IxXJ1RlSMzB5yG1T
	rRltdURBSn6Vi3AQAk0b1Hh2iF1f0=
X-Received: by 2002:a05:7301:fc0b:b0:36a:18d2:8c79 with SMTP id 5a478bee46e88-37520216c5fmr571811eec.19.1794260462226;
        Mon, 09 Nov 2026 13:41:02 -0800 (PST)
X-Received: by 2002:a05:7301:fc0b:b0:36a:18d2:8c79 with SMTP id 5a478bee46e88-37520216c5fmr571765eec.19.1794260461408;
        Mon, 09 Nov 2026 13:41:01 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm989985eec.12.2026.11.09.13.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:40:58 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v3 00/17] wifi: ath12k: Add support for
 QCN6432
Message-Id: <179426045796.3811579.2501311030942871658.b4-ty@b4>
Date: Mon, 09 Nov 2026 13:40:57 -0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4NiBTYWx0ZWRfX+St1qYqKKGcO
 2n61nx7vpi9BDaAJYhnAff7RRheEcUkEk+4Vheq3A/0aJmdw0BH5wS/t6cJKWe4ydGK7UmDfe7U
 wUMAWbbYLapG26zw2CUu1pUmFTSqJU06mmstEVBVoSM+TxKzoSCXeSvesM8XYGfCouShFzXovrR
 jHqJbLNjfqJOJNL+Aur3BF+QdeAxKER5GK0UyFj8ytDNgQ+/5lB8HHrDfna4k8zMPgs+V05ZWGc
 VkcO7dm5EYPMeGoq+OwO8WRoozWF8kXXLVSEZZqxdEEFv52H8/05D4723IB6AjqpxvXAJk3/bPu
 D4VWRTLCStQTcJ3ZUO0yAPFo22paTqy+Ar7NfYeWGJ/cZ5gZWcciD2NcbH9CBZUFWzsv0Cim2rA
 /oqGV3W7dl7+OWoAR6VNy1PqLFvmYwjMxSKieOAyWgk9KwAbsC5zgWDDSjv1ze4Dmw5rVLt7nCu
 FbzEMBw1D5T2dzYwKgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4NiBTYWx0ZWRfXxSa0gNeN00to
 fvGzjDq+xAy71W57sPhxg/SAFwK5t5TpHmZyhY8hnUBXcPkKuUq5dpLvESHekifWKVu394+aq5n
 qLaxw6SaQ976lzzArtNaYBei+Dh5YQ8=
X-Proofpoint-ORIG-GUID: CgbL11HmDl-KS5u5qDmXura-bD3HOCb2
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af23def cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=oLphvwOYPl6AvyYkXNgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: CgbL11HmDl-KS5u5qDmXura-bD3HOCb2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090086


On Fri, 23 Oct 2026 12:31:03 +0530, Aaradhana Sahu wrote:
> QCN6432 is a PCIe-based device attached to the WCSS Q6 processor. It is
> registered as a platform device (AHB), and remoteproc APIs are used to
> boot and shut down the device, similar to other AHB-based devices such
> as IPQ5332.
> 
> However, PCI APIs are used for device setup and register access. Since
> QCN6432 requires both AHB and PCI APIs for its operation, a hybrid
> AHB/PCI approach is implemented.
> 
> [...]

Applied, thanks!

[01/17] dt-bindings: net: wireless: Add QCN6432
        commit: 42da6a0777de4ebd6a4841c324e6e53dca8a5850
[02/17] wifi: ath12k: Refactor PCI operations and MSI config structure
        commit: 7a694970c901406b2d308bd49cc6b62655795196
[03/17] wifi: ath12k: Add hardware parameter for QCN6432
        commit: 7b6c88854744df5b407b6e992cf105b8c73bee63
[04/17] wifi: ath12k: Add hardware ring mask for QCN6432
        commit: d4be9943adb7c04cea4f9a20c2b084be73acf15a
[05/17] wifi: ath12k: add hardware registers for QCN6432
        commit: 907079526eab4b5cce13d0521ce104e6a9f4019a
[06/17] wifi: ath12k: move multi MSI vector flag to ath12k_dev_flags
        commit: ea97a091f2462e05a6501a3bd352404d9590b274
[07/17] wifi: ath12k: Add hybrid_bus_type in ath12k_hw_params
        commit: 9b5a7ca569c98cca3e94eb8484d69d32df71ca00
[08/17] wifi: ath12k: Add hif operation support for QCN6432
        commit: 7f83e54fb9ebdc5cf2468b8f0c0fcacc4efdba0d
[09/17] wifi: ath12k: add support for unified data-region memory allocation
        commit: e67dbfad7a497ba62ebbd3be2d989f699cc3f7a5
[10/17] wifi: ath12k: move MSI config to pci.c
        commit: e40bb1f7504dccd2342c877ca605aa8f55f26833
[11/17] wifi: ath12k: Add platform MSI support for CE
        commit: b9bc9ef941bd40efa7503aa37b16bd515ea3b965
[12/17] wifi: ath12k: Enable MSI interrupt support for DP interrupt
        commit: 4efe1e0f689496268f74854515c0f211f5a579f1
[13/17] wifi: ath12k: use CMEM write for PPT on hybrid bus devices
        commit: 206da6eab6748d7989094c3babf320da60f9fa45
[14/17] wifi: ath12k: store and use MSI data per CE and DP interrupt group for QCN6432
        commit: 3f5a096554996ace4bdba9b942600d2906a942b7
[15/17] wifi: ath12k: Derive QMI service instance ID per protection domain
        commit: 9b4353d61a6dbc4a9c72831df2379979311a7911
[16/17] wifi: ath12k: Resolve userPD ID per device
        commit: 4342c7914e4cb181051524b43a297fafc2f7a9c9
[17/17] wifi: ath12k: Add QCN6432 AHB support
        commit: ffa3eaf61775cb2239d22a138aafd2ba03374515

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

