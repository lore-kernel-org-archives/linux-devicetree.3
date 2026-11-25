Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598535;
	b=Rtpzc6wMsoMbyZpCbvCZXlFYPHkklAn3EqC0wpCfiUIXml/Ng2WmLYYXMWtxLg80Yzv0
	 NK1PbVmrH1Ho3N3YNjDRnuArVdFT+V/xln/LW7iGQ2q3J0kUL2+Uf3Sy5im7is596cqQi
	 bg3xy6ejHh/TpMSUF3Jo5+aRREaEGv02FohSlrlHaNzaoZ73sfeNfPjBAKlK6IQ07kArs
	 5ISloDB3AKCEGWbNHurzQnZunPbD18fCTuJ5jKZ5MQvgT94MX3VN9j1bnNG7hXw4RFB8x
	 wQPH2xPmKShNU7eUH+JFtx+MOuWMe1vylIBXtp0Eu2CFW4GSwBbDybF7ZvOD1/m/IXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TBFTW/HQCXoBIwpfuLgEB6yzkQLMEDVKMLd/mF8Da/s=;
	b=Obzya99ZJiIPA/G+9SU0ezsCwWrO4oOMA2LKqFFyYTrcsulz240+9rGYdnKrlRBgP2Vy
	 fIPAs2UTfYipsv9w2EyoDX5yyUg5gVsZyBF0iw9+RZkKU59eLBK5e7PGaPHHBQZFvkqQO
	 jx8XI7D/CbwT6pJO8X2YPVcLw9RJwlJVOJvZbB8xlyYxCb9q+dkkamIT9Am2RplL6LZwp
	 egOnFEhGcFhqM+X4u6MnfVobXYMGjlO4rSTWyuZ6GLGvFfT3FppJvrFIT2AP3mye1Pp4Z
	 cDG8QsnoRRu1YyCOQA3YvXfWfF2bDahpPrOFLFZhK7YHpok1mfwrttsymxF9WFXZ3Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ke0TwPlJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W2zVKdL0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B89D606A6A9
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B89D606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ke0TwPlJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W2zVKdL0
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP698Eu3114990
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TBFTW/HQCXo
	BIwpfuLgEB6yzkQLMEDVKMLd/mF8Da/s=; b=Ke0TwPlJj6ayq6TKFkj8TaemFBY
	2SlrXPF5I1S2hJI8ohxy4EKlu77aALwJJJHoPoQvaE1z3y9aH5pHgCtiwMPYuYNm
	2pg+pM8CM/Up9EZfk1UF9t2mqNo7IMHLkThLI8u/pEZLdjrIoWylzDJkqjMh3W5z
	6b0yLVT02Lg7t5OybxonJl5BinG4bjSAZvaWzCWO0RPLXk0j0tORlrDmjcAQpZSg
	HhrWAaHH24L1LbToSSKyMVOC++IS8sM0k4P6vg/d4s3FuRP7JULvdoAmc8XrA11y
	8hAfKYNuVQ0QWDAYzfGNT8z0Gl9qJkveWCDyNwMgN6B068yQvq/eIJJVCeA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsausu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:22:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ee04c49451so67418895ad.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 01:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795598534; x=1796203334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TBFTW/HQCXoBIwpfuLgEB6yzkQLMEDVKMLd/mF8Da/s=;
        b=W2zVKdL0thF8AS8+dGxkOTIstE8/R3rLoaMYkw2sX3iUdoLb1zayJl6hitUlthMV9s
         JBCJt3iQtZDz7/raGRhuo+qslPheJijpCiX5DZsvmeX2mY+UoXtV9fgyghXYJmNXfxIi
         d4ztxYhy9Ied+R8r8oIJIL08EyrwE2vRlsLHADWz6RI3lX5DoHdNK0cDADTL1dggrKZm
         9NEBeEyOxDDLnHvRMSAN2VrJI+u43+WodAkykyyZ1aQH6NPbtdHvD9oK/IhFiGhd80VL
         wVo3kJGHsSeGb3XkSfZcPYvgS4KAt1vRc9v7A63YpoMR+rABaD6Tf7UIgzcBJB6GvyIf
         ytLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598534; x=1796203334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TBFTW/HQCXoBIwpfuLgEB6yzkQLMEDVKMLd/mF8Da/s=;
        b=lvlERBnXLcT+eHNz4YQfKYfJ0VbRDZ/m5sGhRNViJqnsgvmJlg1FOdKfO9rhYEM8Rp
         F90vY+C78HrFLyGWYLLm/+Q26tDHZ7UNz0RaI3qmhULSNhZWNRtp1auggb9MkZgIjE0n
         PsXPN06HcHauh1WFu0ZMPVinnb2/nnbUsi/aerin8xUBE4cmqr+7IzG1Minlol416GSK
         5fJ6aH3wCiXx15Z58Pq5FM6VAmx7oHnadWSwGIA5peRaGUjjjh1JoK2264c5DZb579Mx
         v3gDhQsNmznNHUcbHrgVttJcp8dszv5EwF/okJuUewE8XXDgAdWIfzms/JdTznCcO78I
         cMUw==
X-Forwarded-Encrypted: i=1; AL+hErE3UrmzpF10gJ8OeJdDULN+Fi36Lp6K6rdEJFsNVH+uqNzZ8FVnJmZPcu34jkJRkMeteHLeQcpsmoX5@vger.kernel.org
X-Gm-Message-State: APuU4Z9bKiPpazOjoDrjJRRVBdkc2HSLEtKP6AFWqhOmnlGSj15z4bvR
	Wyg68J0gyIGN37Q2EoDUbt00tJac5ZOsiC9sAHBglYj1HaxOax+nE008E/mHGOtTILcw+YNPbux
	IRMEaX3LCHL9FtQbI3roAkzoOIx8pfKBcCuPea+k6CW/e+IqbiOJP/Ouy232cN6e9
X-Gm-Gg: AZFdTZfs0KFSjE3YDJrGoQNa9SMcIOQopOaD32EYinNS7Sh20LtKGZvbMmR2GTRxEkb
	snUmtT7YNaHx0qdGp/hF/FT108s+pRWdSlHKPW08BTLeGZcvKvL/vk4y6Oo4YKjMEVnFn9clrw0
	uiggKS0uup05QDNNxcnpYWrqQ5+d6HMe9nrWq0+z+VPM7EGYvCwPGHs3YUaRx/hcR5+sZRR3uyO
	a4kOY0+Jt8Z/vlCKv4d8wVxADOwpoiMiqyaVPAqLwRqpkHy9xlntL1LL5Y1GoKNf/TIxOZxBLwA
	zq3EQqsTQTZ1avfgyepQRkBikUQzGdtuzky3coCgrDg754N+l0JVUEobohFXu8PGkNGpqEUHNt2
	TNkS65u8jBcKFcbzH5GK51lkbHtNw2aDXCiCSgoDRu0lx2cbI8mV6OcOzVyuxvZe6wNVd5oy1dP
	YdzW1Bo3PeGM16rIjigoNcMZBnZLfaU/gZevjA/Mz8KkWLO8tzw7IvUQ8=
X-Received: by 2002:a17:903:37cc:b0:2f0:4ebf:84e3 with SMTP id d9443c01a7336-2f04ebf86e9mr143722715ad.60.1795598533845;
        Wed, 25 Nov 2026 01:22:13 -0800 (PST)
X-Received: by 2002:a17:903:37cc:b0:2f0:4ebf:84e3 with SMTP id d9443c01a7336-2f04ebf86e9mr143722555ad.60.1795598533417;
        Wed, 25 Nov 2026 01:22:13 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c2091sm81538925ad.20.2026.11.25.01.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:22:13 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: qcom: geni-se-qup: Add compatible for Seca SoC
Date: Wed, 25 Nov 2026 14:52:04 +0530
Message-ID: <20261125092204.196196-1-yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8407f7d3-94cc-4ee2-932b-7a46e9d195d8@kernel.org>
References: <6e09e1ce0d9250af78da72e464b7f99f942e1d7d.1795517657.git.yadu.mg@oss.qualcomm.com> <8407f7d3-94cc-4ee2-932b-7a46e9d195d8@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aStnIAdM-xbCoGgcFKPXRlAgdLugtRFs
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06a8c6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=nWgBhYJttB65tbEiwHgA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNyBTYWx0ZWRfX/Q5ZPoT7u0Dd
 6POvq7xxcBdCcWWo0KDD8SwuDka7pDgL+fEYuPVbZciOythsvtA3xEkLoIcOSQ4RxvXawRo71kY
 lsfYqurn64c0RhZnqGhAzGgua75A11M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNyBTYWx0ZWRfX8C8quYaJKkTR
 bXYWaJjKTx4LCGmXSk3v8r6nSJXFcD6DdIpu+j3wGiQ65eOyAdh/2ca96OOG+4gGV5d5VnibpWS
 UhtuN4BuL5tcf9Abfk1owCd+O+LgL9POsXknKEUeqX+EpYGOl1G/PDcZFOm92JHuoJM0LXL/c/K
 pWcEfEb3KprvGrUcVqzkPV08OVOkyLg40uUd0KiLPNq7kPLQg4LQFuER410eqkm5VDfs6RYoHLO
 +7vWxpwYwXg0aGKvXTYOn+U0GKO+bbd41AoD7qQNESofRQgEltOX2VJeXZJ6QP5uxoVnLcBRGwt
 ae4WS/Mwq4/+9Ultr+MgWbNSbAtvDcO/IEvr1FtjshXHJ+9GKFLd6+gRj5BPIkPxbtVUsQckkF4
 49EU/RZfs+0vRpWfAhdHaW0icgjpIXsAX5x+vf17N0SZcB5nkbeg+kLZNzzTuRDnUOSyhuHa9eY
 YaqqprDOs5WF0p/qN9g==
X-Proofpoint-ORIG-GUID: aStnIAdM-xbCoGgcFKPXRlAgdLugtRFs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250037

On 24/11/2026 16:46, Krzysztof Kozlowski wrote:
> Why are you sending EVERY patch separately? Organize your work in proper
> subsystem-targetting patchsets. Internal docs explain it well.

Understood. v2 will be regrouped per subsystem tree: SCM and the QUP
wrapper together for the qcom tree, IPCC and CPUCP together for
mailbox, and one patchset for each of the remaining subsystems. The
DTS series will list them as dependencies.

Yadu
