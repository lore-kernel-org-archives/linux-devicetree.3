Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517690;
	b=vYOy5cfhv5eBDwy89+pmUUSvxqkIXoaoKoV5Oem6U2lxwfsbXE3dwEFO8H4zAb559Jgq
	 CuhCzGlSHlWP9yQSHmDNYXkiT5MynmPEMCoXQSWfVmdqEOLb7JAIS0KHhejwomGW6HAWX
	 soxE1vvGY28kj3VQ64cD+9mwUhCzbOTMTOAaJARbTtWyddgbrxbp/WbBH/c7A34XxXMQy
	 /ayDSzhYZTmaIUfGI+UhojL8lxcR5cL0hs0j/VTa7l/5oQVeORnWwNfFcGlM1RNSQZyf1
	 Ot51xrtrS378f45WlF01ee8G7jfiD90amdDH4wNibVppr6HeTUhxc6FmHCSDds+I6fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517690;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rAp/Ls1/54nALRkGPdoe71Dsv0aoi886pdtKQJOKrIA=;
	b=nvwcSqu7bf69HgpMrHCqRFJNQfru7PCWz+W7YOoyN9Y28XBcxCTHBENJjW37AhSxyOxq
	 +i84eEYMta5BSY6oYC51Tq/jUQ+fp9WedPcmVDwyy5vA8/M+jsRKqVqHoVAJ/ey7BVHMb
	 vLZBomWIm6GY70g5Ab7FuxPWfe8lDshRg2RYqMuVQ8yuEmvBnO875J71oNZ2eKXR4/5ni
	 P0RqeoT/rGCbMNCMNo5TuujT4ErjscCrpE7Q+zq5udjHZbp6gLL1eEVaibNU32Q6mubSe
	 4swnPA/xxeY2xaqEdsCtS8rkqjb87jU52KWla7mbHVPT9PfAh/xDjbpU5qlgXGkH4Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FvO48vrH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OFuq2I9C;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96484606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96484606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FvO48vrH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OFuq2I9C
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5mJVW4136348
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rAp/Ls1/54nALRkGPdoe71Dsv0aoi886pdt
	KQJOKrIA=; b=FvO48vrHs05wyahmPTnBZZjM8Fn2C+qz3XTVR2X9tJzJqbZePyS
	aaVDddS4Y3J0YgLsAyKOnUJk1BNGHN3TswDAm67XOPnflO3Y4Wx2rJ26oKz3uTtz
	u10SyYo5g2TO+ZYN+DIvg+idTAqQq1RPZh0AAj6qJxlYru9/h1417JUJRC5OAYBl
	xsj/9z14BQ6QehSpR9r0kduDCJvD1uY7AWL/wBqsNGBQZIEmfV7x5+L5UgixrHDW
	BV97N8qLPwICsIv8YaWxyE8sL3iUhRhASB2UWVTu14ZeptTwFYq6j6BptweH9rtH
	bLYhMvsxZ7TjpMx7sFSZS49BCAHIWOW53bw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rph9yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:54:48 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b55f4f3bb8so2327524c88.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517688; x=1796122488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rAp/Ls1/54nALRkGPdoe71Dsv0aoi886pdtKQJOKrIA=;
        b=OFuq2I9Czqc49CdOiceel5dN8v5b4Id/BRVYPjNqCMmi6kNgepSGgTtouO+vqu8wbc
         Zuy+UbWUxbn7rw8hUtbjyU0i+UsVwKo8hAEDp0litCOBOBzgn2r7jp+8ef3ldEk7OtqB
         A7tZUSqctCG5bgW1gnA49U6JjqrheY1ZrSfSYe2ASxsQ/ctauN/ahHvY0gaYwYygTLTF
         fy+bfFqLaW7TUAJ+QK5iQdPiZO8xTpmaWVUs/8cfGpJEQX5qKRIwkwCS5wSj6ZMrxeGb
         UmnYSdk1v5JS6vITA0TCKHRb4/v/wp70yVzvY1+/BSWyOM+v009HstP98eq9UzZhIUrW
         1WQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517688; x=1796122488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rAp/Ls1/54nALRkGPdoe71Dsv0aoi886pdtKQJOKrIA=;
        b=kcOk0x67tUdnS2Ky8t14saKiS/rSaK+FY0GZRpY/B3LK+NDD/FL/1IMIuAAzND+U3f
         Kv6GTobCQXtogxDeI3wPIjr5dEUfOYosB4AaXDJMeykfrI4S7OfFCbHXVL7u3e4zwDws
         ib5ha0/caNnHXg84kD4LQuyLNv3nJLIZTdB1nfm3aWJOq+2P35NIQ1CUbQRe1FxtblcL
         ye3CXPx5wM4d+zC50if7DLfncjdAxPs91YmTZlFIhdaQr89Tmjw4Zx9FUDi8g16lKF3L
         AlP3cb6vxK7IK5oNYp7gp3RTFUj+t4und7OfHCSUMZFwuEi+ppkKYpmgB1Q6T9VEXui6
         xfpg==
X-Forwarded-Encrypted: i=1; AL+hErFxzYVC7/+19zks3kcqDTwjQcysokh+JtSOq2WmUDA5K3BcrkPaUywK3g+ZLNIvpOzShDOIKy5bLi6C@vger.kernel.org
X-Gm-Message-State: APuU4Z+5NZ/OFJX9Ng5GxImIZGJfgG1p71IKOY8XYRlSPOrsQdRCgF4g
	fgikTI/CXvmomMCqE5pvjshnaA/APGAKiQZQZ2kTi8y9bxSVjZXoJesd28RyEC8H8PlbN365p2/
	mW1E+ui54ZvTIEc3EimErh95cJfrS/XrgcrnjnmRj8bQVLHjVp2Gabm1bFWxdaMwJ
X-Gm-Gg: AZFdTZfiANSzdZ12mbth0wdrO2AMU0ivvgvmpJ1LDxt97uXaxeARCHXGn0QQfRZTzsR
	vbd/mksqnEy6jZ9wMg8AmZ6Qg2xjsQpPofSbnSwb/RJewxCo40+SG7pj0wnIANLu12xpnfnBxUy
	A8Ru4mK3AULfKJW8yOF84VMq7f6Nk0OoRKngx+AeWnukPU2lP8KzeptWzobA2Ks2NY1A3tpd/+p
	TpFnJuQCo3QBCBnKpNYlpwFuxgIIBs20U0sGTKzF45n6a2Y9jo/or0taQUzvJvZG8eE/qLZS60V
	mo9LjG98dUmnjQjNWuLMZ59eOfJtaBKAmzc0OMLFDBW2vMDUP+M+czhAKCv8BahB0JCr3DapTxz
	zLe8pzYOl+1o2rdeH/nctPDnvHIB49t8LlmD89VWUkokuP6odvUHxVWeBRPQ+yczRiJFYjGZioA
	af2UpkCWxNr6JcmFWG7seh7RrhpnuLKZSHhgwZBKINB3MH2iGf0IJA3ZMG
X-Received: by 2002:a05:7022:e981:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5568ac1d5mr17920638c88.21.1795517687434;
        Tue, 24 Nov 2026 02:54:47 -0800 (PST)
X-Received: by 2002:a05:7022:e981:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5568ac1d5mr17920609c88.21.1795517686848;
        Tue, 24 Nov 2026 02:54:46 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm38072085c88.6.2026.11.24.02.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:54:46 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: serial: Add compatible for Qualcomm Seca SoC
Date: Tue, 24 Nov 2026 16:24:36 +0530
Message-ID: <9ec98ffd6cec85ad77738128329ec77777a1f69d.1795517676.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX014j9XInG17V
 b6LKD5RYaN6pnmHLNkK6GvWC/TWdXrKCQ9kCMoojNFWsA3R4TSqGuP7c1PyXKruylPMf7msY+D2
 QJdgUjV6Y/cWoGE7DdTANIQqVCycTyf6Ek+sy9bayZRcU2L/3+CzSHzh1f3PLZ6NHKd1EHWkHmm
 10SK3Z5rEK0+WOe2LQqQlRy9K5xHWNZS4/NPOafcDfA4OqNsZAQxPWDEiIBVe1KOp7fFyCJwP0h
 KRH/YF/HzyiJeApehBI55w7RlffmSc39ABo4txDFF5PIUKndEmCILY5UKrJPsBNFtJPsnIYieha
 YcMp8Qg7mlQOWjyOW6gTja2DQf+/pjkHgPdp2hzp3KLoeajwuRJu+O7wFLSwgKlU688UskO6Lum
 auMp5P0wHuw8sqwmyxPoIAuoVGGUMWe7tVxB2Gv38NwGW3G76knHtWyMkD/06jIuroK2+VYYPLg
 0HXKhNDB1b3zmuIBG1A==
X-Proofpoint-GUID: kge1Y9buyV80e5BUk-RqKP4QBcme_0Dq
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b056cf8 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXxJv0nG2vD+KD
 KC5RDg4dOADPp7VCLMldx6zaa9miMx8phKUazKZpfHEcVZerN3vlVwiI7rh4VsuS7tO0EJWrn0C
 BsC45BzkoalYT+kIUMLd2g2nZ3JWLQk=
X-Proofpoint-ORIG-GUID: kge1Y9buyV80e5BUk-RqKP4QBcme_0Dq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Document QUP GENI UART controller on Qualcomm Seca SoC which is
compatible with the SA8255P controller.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 .../devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
index 8496f822dfa5..8415764222ac 100644
--- a/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
@@ -24,6 +24,12 @@ properties:
       - items:
           - const: qcom,sa8797p-geni-debug-uart
           - const: qcom,sa8255p-geni-debug-uart
+      - items:
+          - const: qcom,secaau-geni-uart
+          - const: qcom,sa8255p-geni-uart
+      - items:
+          - const: qcom,secaau-geni-debug-uart
+          - const: qcom,sa8255p-geni-debug-uart
 
   reg:
     maxItems: 1

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

