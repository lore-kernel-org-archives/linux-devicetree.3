Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440906;
	b=ailujh1h23Iu10lqvH1Rl5H1MbyXwXlSxfbvFF4zpGDLnkemClNwvBIPHMD7ofcZdkrW
	 RRZ+oaQ3zeyGTx1KVe8L5Zsn4GbB6jXIkxREEUq9Xk2NNakZOc5XkpxQBN2fSPRPMcfGY
	 hKeVn8BEnDKCC43iXOpp0FJ0idQXUp7kKT7jUVilfFlUG/HtFwowvpGVp4Vx4jrknFNFG
	 L44g+7U0gvmduRG6hQO7DuuJXEeq52uzmLGMFojblsO4iDv9eqMXtQnz/UVfxqv3H31Tc
	 eswOmYz8Nvwlxob3eT3RQvJMAPqKRBRrm+qygDT8xUcTI5StyfrlFGgtuZ437JUfJvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440906;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W4X+lIkpMnuBPXB5cEtedMsQlEel+NCp6hl7V/xtT3s=;
	b=IzWJ/7vc3ROhX/pW8COYqUjHHWbkX1ZvZ5KK7ir8byfnpADYsuGvtPC6rk3Qk6YDBOPw
	 ZRqjPhYmI+MgVo+Hx63Af3GmgQExDWveTMYjOiFl1DWW87fDCEujuXN5oYwKatWBMyG1S
	 iWJ3jQt5IyOGvqtkD7jOfk3CiYprgGs5bQo/rcsKZ/eGSUyHAJ21T+ZHUgirmETjvdXxq
	 TioZt8Q3cBFNGWhOiAfJ7OrEqoET1Kd1k1RbnKKRDqzzU874QY18delVeL6w+HqWxmhog
	 Gk4I3kHmURt3ASjuaFrIa4+7HbmuoHEhnNZAp7feBiaPDvSvQJ42Y5gkIlQW/M/NPpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VEFaZBcv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hhkGzK6B;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A87606A321
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3A87606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VEFaZBcv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hhkGzK6B
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLGAg1461376
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W4X+lIkpMnuBPXB5cEtedMsQ
	lEel+NCp6hl7V/xtT3s=; b=VEFaZBcv6QGdGPm6O/xtuaSamAgwZMZvMl+7bE4H
	kMgAoM+nduS1Hxg0u3aC/Q3I4DawmUMY4gcm5indKy0X9c9vHvhenmPBCv2DMUMz
	yc2nPqgCe2QiA5lUXX7+eO8cad3MVuxjebjLtvafW9YoMz0kGBuERs8N/Jfin4bq
	gNbxlU2t1K6GypHjoywh11oJBj4AZxiIhPCAvnjNX4yUgSfT3JiXW5zTLYTu/oGw
	jEz0eL4k0C9AQXQqy43GriIh4PWHvisZEAjof5aTNIjRMS6KyqFVP4qritTfFctp
	KWzeXnAPVlTVpEVd6S4iZY68WHVGz/sesr6gdTh7ZSxRHw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a1hcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:35:05 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b37869f851so52820217b3.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795440904; x=1796045704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W4X+lIkpMnuBPXB5cEtedMsQlEel+NCp6hl7V/xtT3s=;
        b=hhkGzK6BXsmbaSYX5+Hcbi4s7pZ7AMQf8v6TJ/i9eXk9UMOkZIBM5Grj4hT6RQkBk7
         PRmzol2EC1MFVdKgwb3Qq+FPN3Yoaqst6q9YFW/Z1nF6nAlcT2K3Jkso6h737AyD/qzj
         uMz+MGtVx+8L/RXYHxySu5EKZ700RXpSj8rgLEVk4iXf9CDuxKYi+Rtl5sFwq9VjptO7
         DE4TSuDWeq8nsLNWqb7SiQvh2SOeZPPkR6eDV+7s7rJAsKcHPOITt8kjjQFFdN0ltNWq
         MJaOO/gWhYiE9OOYfAdm8YDH5TxE+b21vHzHQTDBssVPdvewinN9LbbnNFq2j/YesU6/
         ppiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440904; x=1796045704;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W4X+lIkpMnuBPXB5cEtedMsQlEel+NCp6hl7V/xtT3s=;
        b=JqNKW21UVHCPKo+x2FWBcSTPPgqhFivTlCg5t8i5RTc+2zbWU37rNZIiSrNGuaWhEa
         HFZr6rTBEbANdLRRbAO3AInTcWJNAv8/4VuH7I0viK73ZdMsLZ8Ncwxtuz6AJtcZbdJM
         chDgUW28Sv/5ce7VmiActbB+iHF69+VnpeNk4bJZsSYeyo9irFiSn57+oKoizu7WsW5W
         xd7HChdsTPenlw5r0olIZtA4QYKiJvFO2ZuP+0UMR15/ipIZiEdC7U+2vInjbdQzkiWl
         gid3jjRFYeABVzSWq7iU5XEasLV28d1m7384z3jAV3d5QxO5pz057o+xF2mrY3zcEG3Z
         /Izw==
X-Forwarded-Encrypted: i=1; AL+hErFzXyjPaktU6NkunqV06uPpLsejOeaufKXoVcHMfLgujsjSzWe6/woySwFILmWeAFrvPdFm8UzPjYZF@vger.kernel.org
X-Gm-Message-State: APuU4Z91ZSYzT3OUE15VSFvXZ+Fes3Wl3/JeDcOXYMx++6yQFd4nYk1W
	azp+p8GSLnLZNPnEDgvi5XIgkGP9jcC4PU9+QozbU69tMLPuqFE03DlqiamCzqlpke6/iO147MN
	19Xa5dihixGhX1TUUnP7yjFP4B+EJ5X9q7ElD2FiU6JccAlTkO9YbPCn4t7waWI1X
X-Gm-Gg: AZFdTZdqIwMiFuEUx5rmf7trP2yD4KlQeBuOSVCKw6iZQmvff8RNSqsTCndJ/2bfSX4
	beF6Y1HVK84lL5xvcOlv0GdOcW4YPu7sdRMaAfPEEFFAUBXHw9iGhkePxhdXGecskUYvP578UTK
	1QJ9PTvbIfmiOa32ooNn55oQA8woxkg0zwFhJCiq/hLgyOx1FtilbI8/LEso7zCtBHEkqmAa1Wn
	Nvr+cK3/NhG5q1Ec0QloFIp8e2cZXrA00aSZMPKDJsrTVl/4V0FgWrnJSJetRXp73wccPgUF5l0
	CnR5iPeUe5Emg4xlrB8VSMuJvY030IpKqEEpytkohOMDIfR+rcf+fP6sjGTO4kx2revQYvwHe5d
	3vcMOhZMQcwosUEeqr5jauqZfPy0mL1+BZApUDVux6oPeDnblkbVdilglDQLQItzSPCarxqatrq
	/+M3XLDcCevk0IW22p
X-Received: by 2002:a05:690c:2a44:b0:8b2:edac:7a4c with SMTP id 00721157ae682-8b52042bedamr39514777b3.10.1795440904411;
        Mon, 23 Nov 2026 05:35:04 -0800 (PST)
X-Received: by 2002:a05:690c:2a44:b0:8b2:edac:7a4c with SMTP id 00721157ae682-8b52042bedamr39514537b3.10.1795440903970;
        Mon, 23 Nov 2026 05:35:03 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52030df7bsm46300587b3.31.2026.11.23.05.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:35:03 -0800 (PST)
Date: Mon, 23 Nov 2026 21:34:54 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
Message-ID: <awRA_lWAviFJj7oC@QCOM-aGQu4IUr3Y>
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
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
In-Reply-To: <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MyBTYWx0ZWRfXwp9VUlK0pMf2
 6hnsCC7xjVqMEBG3OMSfhexdYHZlcKi9oGjtk4AthRaB+i9KtDCVQIT3o1GhMCCJHwBd7G4vbKC
 Djq7Z9IrJZCRZ2j+fZLNI1dJQcRrF3o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MyBTYWx0ZWRfX1xfJvhNnKf8Y
 RtElRD6kGcdc3XIeg5ro3TFYFpr8bWC4p7evJIUqzAxaf4d5YxR4m0tbPb3gZGfLALcF1n3N3KG
 lM/SIAgXP6MJgXOwV7FvhFdMspYENF5Enin7YwQ7eKb9oep5MnPE1MYhtM0H+MLf3SlTdaOUQEX
 y6zrpghE8GOt+O5fQ075I9i+fX4alwAsKQzUA7TxmsRhjfJ+b99yNoB3ViuccbB30PdQ/amEEMG
 vYB+idTcz/Gl0hsA7TOBT5wZUC8LL3rFs7gV2HXlaAs6Hqv2J4CGUrzjb6uf+5nvn348WcHDJKh
 4+ADSrsbYIIXWVe892J2g2RqemUHKjXcO+1lDeOtwzuD3LsW4gpakPieS5M6DJFAw6UM09cr9Ny
 lEJV8HBeiYZNN1ckOoKNPPrkijZb9xJ0rksALo+Zh70JhcMJbBjoKLKRNNGfLIzBk0VlRaAtjiT
 etXg9ogkamXUOCuOyZw==
X-Proofpoint-ORIG-GUID: 0XTAVk4KqdnQLv82XDrFfUWZAbMLxGgM
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b044109 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=JVp1Gilkp8drtUWwDXwA:9 a=CjuIK1q_8ugA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: 0XTAVk4KqdnQLv82XDrFfUWZAbMLxGgM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230053

On Sun, Nov 22, 2026 at 06:46:21PM +0100, Krzysztof Kozlowski wrote:
> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
> currently used only in the socinfo.c driver.  There should no and there

Same typo as in patch 1.

> is no in-tree DTS user of these, so none of these constants are really
> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
> that part matches the concept behind DT bindings.
> 
> Driver have local copy of these defines, thus these can be dropped.

Nit: Drivers have local copies ...

Shawn

> This has no impact on in-tree ABI, but any outside users would be
> affected.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
