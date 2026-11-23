Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451431;
	b=LgexgW9er4M6Q7ID5VJkI/FXj7WSwpVHToAzwpRoFO9pvOjFZ5dysQwsWhkO4B3F6e0J
	 vjCOrsdwGLmfaRAWFNHLovGhxNnCWtY/u2azrkby3jnL1bFfIHzDbBWZQQ4F4qS+ExGTr
	 QMXypMVPWIpeVQ+WM2JtpOXOVBW9o5RP+MZd2LL4KdElDDsdWBIxffEszmgOcSG7NdCM8
	 XEd8vX1hX6b51OqNBpUghrcZWab3P6Gqsd0gusSfFeFKyixblyrl+fwQL7sNbMwm4rQaf
	 eriEqj+LSgEY2DhKz2KG/0s/LBkoa7CblO/gSEjuhcIhPcyNMM2uelwNpCHAkTOyg+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451431;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wgZfL8OCYcaFEVWVRs6dEMoZxrUulD37lUUHWyqfj9w=;
	b=bgPWgE48/4MnGVJrwxcbQVa/27iUtsLjT/38n70eDTGLhcM5aT+zHmQLif7LJQPfyHl2
	 ZG7cvju8WicdrmNSFhO16ojdHW43Enc/YuIcAsz4j9l90jij8vag+3gpJocLym7vl4Jo8
	 lCTVk4HTkOKmu2jQc4iJCANXKNmLnsJrt1jUJJlzyKthiCiA9HhTpPmszRkQxoVs1y9Cc
	 INNEjiTvLHdhsxNMuLUlGRjeqE9uGgllEUqzidDxhTToyG6H5zeLhF/COBhniCyIuYJ9p
	 HRzphgieeGAIN8h2XP4PXjsWXrsI1BYfF0kizogC0uNvXWmEFAxRB7p4h33sQkq+8Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mgWnxa2m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3jxMl3s;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEDA606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AEDA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mgWnxa2m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3jxMl3s
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGrxf2769122
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wgZfL8OCYcaFEVWVRs6dEMoZ
	xrUulD37lUUHWyqfj9w=; b=mgWnxa2msZDhh/78aD+5C/N8FOOlsQjvX+EY8RJ8
	6Ftkx3pL/fuLZ/bX7oZXJsLdaTIEE5gpMfEZJ+U1p2eOriVOWtEeO1PqJF4+eVOD
	lq7lleRFixoOL0Jze/JpLQpa0YdOUCCJH0BOHlyYNpV61qz961OXFQHkKzzbiU9m
	7seMcdXqmdfUYW3rc4p99IsbPTDe1dbJ33OCnDCjWmNr1SCpsTEoLZrTjAsiogfx
	R2ule6o9S8yYkvGfL9UJdoDjdugcOKhRKtHbZkNE7Rjb4TCh9qLQbk8y6RKX1I/1
	Hgh2HzDsh5/VIC5menYQlMoDcj1QALp85QEe5+IJz9TMAQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1paaru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:30:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a0f79047so3086769eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795451430; x=1796056230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wgZfL8OCYcaFEVWVRs6dEMoZxrUulD37lUUHWyqfj9w=;
        b=D3jxMl3sbEXg2zXYuGnY///1p+SBPYRbIPuVLFqrZOwZEcizJeGcbhnzvenEwqMsaL
         zf0moEPIQAGu58rPmtixN4A6Hd5+0it84gsHQComwpk7345JOqZmFwVM35cEuO52pu45
         cj/mVZcrdrQUSipN935vXMIXiM2I3I/SXePg7zoSmmCMEiuE6qzKVzzrkykeJ//tk90H
         gf/+LdZNvG33Vi1kAkWCfBF6KyThh9fkniHxEgqtRI4xNDgBVAQQElItWLP/m8BDRkWi
         PKK8/IfKi4yKZmeU6A7V5WwUWOUPCT/ah+WEpBIcYxMIBeVTRyYuXsNYQVzgXgHv0XFo
         3dcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451430; x=1796056230;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wgZfL8OCYcaFEVWVRs6dEMoZxrUulD37lUUHWyqfj9w=;
        b=rMgrvmT2bm4+rNuKjRP7RmqLXe5+sWFZPCPcQVhnaR5IHY6eoL+uSOeCEAGLKGqdLU
         pA7Zl88vAbcHX3ki707NZrjuJMzdgeuhijiE6/l/WUB+ryCl0osCwXSHBO4qETikBLTo
         /jtza59KZiqzG3qMi7C3ZQ1DZZGIaUf93mZpw2gUmL3gAZEIezsAIGHJEuETMxmNnDD/
         Qy+d0owSXAcYz+XCelvKeGYrhFuMRWRLjWwyM15uMyD4XLUtF+r4pO2XfXJgej72ZseW
         4TAfmNeWsh2eXjcZG2Y6X13tPK2HlP0xvdkeg9CFVsE/odBJZcQA66jXUO67gAJWHEal
         yWXg==
X-Forwarded-Encrypted: i=1; AL+hErHE/vdxlU4HoitqD7/t9UjFawtqpCF8C3wvti0CONRFbC+dvfmOzAyv7y8F3g9OpIZMlUKJ03TdW9ib@vger.kernel.org
X-Gm-Message-State: APuU4Z//C56dVoBvxMabjy5+BxZAhiYwADHQZ4+wQliVYIo3233606Tv
	0r29mMfRy1jpqoC4aXv9i5MQgTojE7opXEFgLL8A+oeqVMCJtvhkQcFjDaG8tKx+Jt+Scict84c
	WMADB3Lo+UFbSKhKnkFLnAXvLY2qKGk6fBEkxgxZ3IA6nqiz66ZxXz03ebpLmKyln
X-Gm-Gg: AZFdTZdRHb4wvZ+TZukUcmQfRNMh6Q6y8vbh6kv4XfnbWSU+tDsQlXJ4tS0bcH09tWv
	HPVlvKWqeGGcNZfvTqgINWpkDcUfpEHGLIhJ7XiJPyknyRzTUm6k6q5yrB3vw8SIZCuYj1lE3uB
	wklaO47TIFAiYvRNOIl9du7WS9Qk9WeO+0ZRz7FSlRaJKG8UMaxg3dCwyOvmgPz9RVMJ7xpb9JJ
	Kl7GBie5pguYI/Vt8v7YirDi76fGYJyNcR2H8BJeAmY3y1aIzJlsHUa5rl4byqPEIW9Q3JHdsy0
	8ZeNquT4UmSGpHMwmHsFZW3ZB0vmzWBFVpnAbO3wAY/L5jgDGZ6uSIi/Rvc9SRErA2i02RsOaX0
	myPFsHO+vWOVGin2xglT2HBeQbzTdfZAyCz3WVBaltCD28ZckxbtggS34jS2/7jjTHztnOs2sps
	JI
X-Received: by 2002:a05:693c:414b:10b0:386:9e32:a65b with SMTP id 5a478bee46e88-3869e32aac6mr8747291eec.1.1795451429493;
        Mon, 23 Nov 2026 08:30:29 -0800 (PST)
X-Received: by 2002:a05:693c:414b:10b0:386:9e32:a65b with SMTP id 5a478bee46e88-3869e32aac6mr8747241eec.1.1795451428755;
        Mon, 23 Nov 2026 08:30:28 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47044806eec.5.2026.11.23.08.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:30:28 -0800 (PST)
Date: Mon, 23 Nov 2026 22:00:19 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
Message-ID: <20261123163019.msbsccmfzdmfjvei@hu-mojha-hyd.qualcomm.com>
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
 <20261123-rpm-memory-non-wc-v2-1-3e868b4bfa48@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-rpm-memory-non-wc-v2-1-3e868b4bfa48@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX3oqcJRfPCTVr
 mwGRsHacvfN6UVLs0y91fje5xjl9MScJ7LOJ3F/tFPg3yxOGWsU0x8dbY/QIPY+xrYcWcZXmmNe
 WvAGnM4tryczY9qehesFOZi9ucDO6r7SgXPNSEjO1ZzVRCFpXQctAovncjhKmx29+iUaCN4+73b
 P2qbkoHc2bYPIcrX0wnjF+ZAvrOb924mBgNQDAItsAj43LWs31Dq1c/2f/Zm4FWATsV6F4yTYd0
 QXtApwemPpQWw4u1Th/9vFn1WJIWS85LwxfJjTlQ7Tyd7KMlVKFrWg4QGozjHXpRrDS+T9raBLP
 ORMItAkr5H1Cui5pZEjY5MjPLf/3W5Z9g6al7PHAQUEnXMJSFWZf+gaqTj78lwS+XjKu2QHYS4+
 Y+1WtfDJMvlAPuBIbJqdoSUWbZaEq+9z/Vp/Y4egDCNDGDlob9N1sdl+IhKmn2q4zhrFfvSelTg
 UFUAUgbOh/5gN3TBi7Q==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b046a26 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=I6c21bvp6He-TJasAPkA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: Era7PnZChmCuDVcov1zKQ6tH_4iGK0vJ
X-Proofpoint-ORIG-GUID: Era7PnZChmCuDVcov1zKQ6tH_4iGK0vJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX7RKGsIz1wrwY
 y/VYXUy531U7hl+pSQEhbPHfz1pf9xkJ8oCignqTGWPuryEpJqRjx3fwk0vO4JiPhhmd0Ab8eAV
 nt31d+rCvZuP+MY6p67uaW2VtAbgT0E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230065

On Mon, Nov 23, 2026 at 11:48:56AM +0530, Vishnu Santhosh wrote:
> The RPM message RAM is shared with other subsystems, and parts of it
> are not accessible to the APSS. It is expected to be mapped as Device
> memory.
> 
> The "mmio-sram" compatible makes the SRAM driver map the region as
> write-combined (Normal Non-cacheable) memory instead, which allows
> speculative reads into the protected parts and results in XPU
> violations.
> 
> The violations are seen when Linux runs at EL2 (KVM with VHE), where
> there is no stage-2 translation and the write-combined mapping takes
> effect. When Linux runs at EL1 under Gunyah, Gunyah maps this region
> as Device memory at stage-2, and the stricter stage-2 memory type
> applies.
> 
> Add no-memory-wc so the region is mapped as Device memory.
> 
> Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
-- 
-Mukesh Ojha
