Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603785;
	b=LvBKAYlPccVXW6HSLHtSb52lEsrAqFqmYp3qU+2nGV9r9yWuCmrD18i+VX2Yb/CvFyaU
	 SbNBp42aBOciChW53AMgyOHVcQb+zvyfblTwzFH+BmzkYXfkBPMsRwnaLq0jTSVmS8uoj
	 sqcTeoMAHfx452e41AqA7suEYkhLj3t6lRxADN9w1jq9kqWITFPHCUL6HgqtU0iyJdtk0
	 8BhCZqmfPJaZgIf6q4ZdMZ2Jebl36acTbSCE2eXcbKTgZjjjpmuiLgrENQJoK2tL38hC+
	 EYq8DQfSV1cJebOSLpPlZSd7yz/wFBQ5ArvIpryKW9O82o3hcU8Kby/0ThvPqyHqsEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603785;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=h0Fcz3/M+uiOmSyjDB7LDH22c/hTHLyH6qOeY8tpaH8=;
	b=J2q3vgJ9f0N9jGpkKg9RhBdmYTBn2rmh8u+tCiu+4Pu2sup5+Kqtw6fqSK3wSEhhQcb2
	 469UENTKzgaPZhbIqtJo2ooc06hGZSX3p9yYfOlb86ROjOkVNkO9XBtI2DIvpgMHLZ94P
	 an01oO2fvS6Dw/CascJrLh/6B+lvgcQcw1Jzct6RQe8w9tb0EXUG4Qaq0mg6FbokcsAN2
	 NHvdyDYQKEJKpXHV26s4lYmIbda6GA5beK0IYKQOjkonO3Z6WEx5uVpDtsXSkbYeoitsf
	 0X9h0n74kcctgjvQQflT3lWaEErsNJOc18JraV397k54S960gcKXRrBXlWyQ/iOp9Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="HsoW/V8C";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="EHdRund/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E63606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29E63606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HsoW/V8C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EHdRund/
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mHCv3763959
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0Fcz3/M+uiOmSyjDB7LDH22c/hTHLyH6qOeY8tpaH8=; b=HsoW/V8CpuiMFw5D
	wLxNlxpk95W9vXffWpDy80+NWOF2t2SVcVjn8RUZOrz5oMIj/o1yewb2CNMNYcUy
	ybed+vv0a53bCLRiENwkqKSrYe2iKNnSLilwpT69/6m1QcLypDATD/jVxe8IzWKn
	q1Fv51nA2QwMoeeKCs5RpUD0gNKBxx5JNPHQ87KlqEAUjHDmQnWrMhcsJnKZRUiL
	NnU4mQTpSzXaxdv10x6HC0uiFBkwkbb4Hg2JspKZ11qb++8/7TET01t0BwW5zHEP
	4vwgGo1wngVXrWgy/ay4dFl0Cpb6KflzJV0DTG4mOAii97nduYerZcyVdi3kEfh8
	V5IVbA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2rdjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:49:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94993a54a73so50912885a.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 02:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603783; x=1796208583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0Fcz3/M+uiOmSyjDB7LDH22c/hTHLyH6qOeY8tpaH8=;
        b=EHdRund/CJcF6w4AGXIYhwxuzOyYvAPHIhF5UhkNeRU2GwX9EGzkonHTvRGkJq4oNN
         WE2tDKUAsdtnY65xSyp6uoboApClU+ujU335geC2nVWxjOZ442B4dcf5CbrNBRtoElDI
         XcTUS6u20wqxdKqZKd03LkrZHs2Q0sAj09cxhwuam0B1/1HegIyVeA2IpQLw/wMXT3cg
         8LJLSIZiqrBMIIgrVZX7F4PsLn96d2I8kRDdXBI802mOgitUOMJIWfAaOWyE7IhOm/j+
         WYL/nkk1jdPbtjlvgJVIr5AsuVfQLqiwiajUBEj7aAhEwuuPPyyQfcyz8WQsTAReji6d
         zPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603783; x=1796208583;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0Fcz3/M+uiOmSyjDB7LDH22c/hTHLyH6qOeY8tpaH8=;
        b=bxGUCYBdAPLnBaFbJVE4WfDDVFGTl1amCa5481yNRohWHZmBpzAVQodeWZTjK9pM+H
         t2C37uBKNh8fw6/TFAgdJ6GBvni0BpOxXfWoWT/rDCc7OCf0oBJnf0+AwrkPtE0rrBWu
         pjQXl4fuMo2Yx95zWolzzM++vH4jA/OPV4+/OzmLrejoe/T8GEnGFLAhnH8IsDVATXwB
         v/BVSGN1UzzFal3cfs36c/r9ayTAxgbSCS1wUQ60CT9oI3/u9qFt3Yi4AMxm6Q4BCsl0
         ZdlNcsSwKHB1b5CYxQ8QOFwzMjQ8d5MkW9BFFNXuj62xQo6VRAb0u+HGnvnygdIqPGNp
         JyLA==
X-Forwarded-Encrypted: i=1; AL+hErGlPWoBRQ3uq1oPkTeNI2b6Yr/w8aUBw9gGP9QrtbS17ZCHHp4YXibgYRJHbwzIZyvFIUa5BOdh/pn8@vger.kernel.org
X-Gm-Message-State: APuU4Z8CfJVgwenDFCClfbOl0FKaL9Nf1y+LdDBVfgc/NbY7lnF7t4YE
	fK5U36K94vmgIn33jur2NoTy4+cknJlzEgfRz6+9V5iv4z3hZ7IweUcvr8bK7ahT3tWo5NEP+2z
	paMCjHLdN9P8vjgSECGc2g3FNkpPzUI92rnsfhWISVPw5/VgBC+8skRUHMmrJcA0E
X-Gm-Gg: AZFdTZewITN0Xp//eaDJwL4hYI/60rHxYStC2k0liq94+5Bb2ac7NzD6dskqnBiSlRS
	747GWLihJr/0EZlAjqd+BIAUA4aQgdiqFMk9HRJeTAj/WzFGD+bTibfIzzSZtaedHDe4glqNwBV
	/0epSA3fex+HFFa+W7PHSPE/R+ZMDH7qu6OKSPOKR3pYXQ+mgywqmy+CnyGjOcmZJaE3nUNbr87
	5WOE21k7a5KbR25/5v3qitzd6NgsFBzHSmOTPDZSByn2vzAbnU4HzN2pt3GEFvh2RLcbSO4HDit
	rG9CaMqSebjuAqguaMYL+4yjoxbsXb2QaooI5mzHmQJuxpsXgpjzN3+4adqglkFQ7ScJRll2k59
	lSUzu16d2OOumZRENlS3DtZjxFbOeZXgtSg/rOirFunFRXba3WtMWGrfkj48TlId0BOgvaqc=
X-Received: by 2002:a05:620a:a017:b0:949:7642:6de7 with SMTP id af79cd13be357-949ba85c0b3mr3323737485a.2.1795603783396;
        Wed, 25 Nov 2026 02:49:43 -0800 (PST)
X-Received: by 2002:a05:620a:a017:b0:949:7642:6de7 with SMTP id af79cd13be357-949ba85c0b3mr3323733085a.2.1795603782968;
        Wed, 25 Nov 2026 02:49:42 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm618256866b.8.2026.11.25.02.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:49:42 -0800 (PST)
Message-ID: <8fa6e8c9-213a-4af3-b1e0-9b6c3aaa2821@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:49:40 +0100
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
Subject: Re: [PATCH net-next 3/3] net: ipa: add SC8180X (IPA v4.1)
 configuration data
To: robertijtsma@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261125-qcom-ipa-sc8180x-v1-0-48a889acbe6b@gmail.com>
 <20261125-qcom-ipa-sc8180x-v1-3-48a889acbe6b@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-qcom-ipa-sc8180x-v1-3-48a889acbe6b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX8C4VzTG1nWcq
 1GnoMm2J5cvS4Kb3pB8aa0fMYyEVuljkPiHkzOka0JrTutIWb3i3Kga+ZlDgiQweu6OnsDjkxJZ
 KtFF+LBfKY0qKgQz+ltfr+8ZJ0grlX4=
X-Proofpoint-GUID: Uz5-6Edc27LPRyDfKNJVMudAMz-M7rvO
X-Proofpoint-ORIG-GUID: Uz5-6Edc27LPRyDfKNJVMudAMz-M7rvO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX5KOh+426DiFr
 uA4VihbBwS91apiJMtdIt6+oyZ2H3WYKj8UvdX9ipwj0pH9NXohw+F/IMS83Inb+ntkWPbREJnB
 04AFMBl4VP7tf3Adwo6msigPUJUijGEfZM8IGeMb7GfoejC6AmsqZ84bHdWN4r2NT2y5SSyF5+6
 EtAXwv3joNSnlHl88o5t0pHzDjXpMU57ZH+nv4CwKRj31gzt/50Kn7CPpr+9/eZjIiJkIcfo8AF
 jzkZu4JCwy9b30bfyKuhdTQDHA2P/zt5raoc8R9JDWphyAm6KCU2J/BFEg2xG+k3+aLasWCX87k
 OqfsVNHzmbu4z55BNSdNK3Nzt4lvk9RxC/BmRXXGL/OFwxJgNz1U09ctTU0eax8+QIePAdu8isy
 t0VGU9txu5QdIiGtUEVHMdjLn5DnMFaeFpQue22dR9EVMxkh7uJZ32oN/FsrOKr2Pr1j+s1UMRo
 cBLIh3AC06o5tiRZDEA==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b06bd47 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=wqfpHMpB0Ti-P-UBA1kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250042

On 11/25/26 12:01 AM, Robert Ijtsma via B4 Relay wrote:
> From: Robert Ijtsma <robertijtsma@gmail.com>
> 
> Add the SC8180X (IPA v4.1) endpoint, resource group, shared memory,
> IMEM (0x146bd000, 8 KiB), and backward-compatibility configuration table
> (ipa_data_v4_1) and bind it to the qcom,sc8180x-ipa compatible.
> 
> Register offsets and endpoint/resource limits are derived from the
> downstream Qualcomm msm-4.14 poipu/sm8150 IPA v4.1 driver and SC8180X
> devicetree tables, adapted to the upstream ipa_mem_data layout.
> 
> Tested on Microsoft Surface Pro X SQ2 (SC8180X, Snapdragon X24 LTE
> modem) with rmnet_ipa0 MAPv4 and ModemManager qcom-soc QMAP bearers.
> 
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
> ---

[...]

> +/* Memory configuration data for an SoC having IPA v4.1 */
> +static const struct ipa_mem_data ipa_mem_data = {
> +	.local_count	= ARRAY_SIZE(ipa_mem_local_data),
> +	.local		= ipa_mem_local_data,
> +	.imem_addr	= 0x146bd000,
> +	.imem_size	= 0x00002000,

Please defer the imem configuration to the device tree, see

6f82cb4ecdb4 ("net: ipa: Grab IMEM slice base/size from DTS")

Konrad
