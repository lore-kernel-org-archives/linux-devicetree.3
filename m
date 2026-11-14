Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794630512;
	b=4bII1ZB0cYKm4Jckbj/knAKxR3115ht2c+UYUnHvB7rNSaMXNMTQZkn7vnzg2Xdtl/HA
	 kzBW1584ViL6mWYjKm6+Y4RbzSFKiN+bPCgaFD5c4360+ZhD8eesdTrXKfG/T3ierP/Kr
	 S5j638Mp33v6eHQdOvuOTtNlx1IgDO0B+ZJ4SRFPhIB4pUbv4vua/x3lhwmAuGCAyq6Bb
	 YkzW2jn3m/7QU7Y8UyxgJZF0xM2zueuAiXHfgkGatJIYWOWPFcQXaBPJfnweiS7OpSNvi
	 iKExrHFFqQj1fjwli3SFJYRE6q7/bOduad3aDVe3moTte3hz5ZFFTfvFPnaVzMoCbug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794630512;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZSzz+5aAEcXLQdb2itEe1a2h18bypa80aF21lhD+PR8=;
	b=CnWH2Ekoj+bod0feCGfNDbwnW4b+6bZCaoPF81pMZrwh9oQAGybiQdidNv1U1r92nRWd
	 kpvOLfWjLbujAg72qlvm9rxDYQGG4wvLg1MH5OnbZIppwBcTQHiRqquMTkK/mge/Bjvef
	 9u0BrxTb32inqcQB9HyNPidFjCfUwny30p9Iw2gMKt1lQko9Krxk3fOeEsHejenPKmJYD
	 xo8bjU9yghpn+wv/gsg5H8GodBDRyL7ZZwyRIhHIoV/R2zDdZpBH0nxRxZyqmvJeVOyXl
	 dII0fFLY/udWdxGAdzm/iNLqRqTBMLm3sB5H7zBL51X2L93r1Jt0+h/dM1b/BmbI0lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pa90DZxi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dhnAbi8t;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB51606A32D
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 04:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EB51606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pa90DZxi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dhnAbi8t
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE28fOu2840797
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 04:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZSzz+5aAEcXLQdb2itEe1a
	2h18bypa80aF21lhD+PR8=; b=Pa90DZximbUntMHC944rpFIUC8hg05bSCAwuT3
	4Tja2GR+ttMZDa82j/3+BGa0R4KuKS4sV9t+y77w06hK+4M14ygD/QYr74gI/1Ad
	rl9SW8bZ/eX6vBgL15+HbGsc3EyRBuUE+7HFbWNIsam0LWKDeh2d756RMic45hyz
	9Y7Xnd1zds9lPt7Sbur9Jq02mRM4etjRy/xfqZvSXO/4OUZSlABb9HFyHBLvEfk8
	MOz9XqZFeeB7D/Abx8VsPPVvIOZL1+sMUv/C+8rmQ6r0jHpq7cxvPmiemE8Tae8e
	CvCkad7vWXIRzFoBSvtqiCo6yC9gYO060c0xAOo1gUtZMnhQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxekr89d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 04:28:30 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6dd1142710fso2934729eaf.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 20:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794630509; x=1795235309; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZSzz+5aAEcXLQdb2itEe1a2h18bypa80aF21lhD+PR8=;
        b=dhnAbi8t1J0w2Xh/IX6r3kFm1j/0fpJq+Krvxb7wAEiVbmAAMkq8U1aH1T89m49kSY
         aw4S65U1vjcEReboyL0fu8KThshVT6pUxDCRqJ+XnP6o5v3nAN1QYCteS9UF+imweEIM
         8i2DpM3JiMW0QLdC0YPMRy6KD7MBHm0WDDfU0bA9JasH8cp03uz/RwcCrZmbqU6kVsxY
         inFQKybb/Tc1WRa8vZts1fCw2UZJuKAVtFHqpnbwE9jRPDuMvq9UG3roPHmwUbdgchqL
         eFjEIe7C3Lbt49uR0tXvu3Khg0iIT03JbGnix5TCCxcpoyOXx1NK9cFpLzvmdyyQORbZ
         gm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794630509; x=1795235309;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZSzz+5aAEcXLQdb2itEe1a2h18bypa80aF21lhD+PR8=;
        b=1S0nYC0jVJ5/tXEq8zf7Vri6lx52Hxzm2BkZyscXTEjIS1MhR8QAy5yjvAhSRTtsvi
         +3bSSZr06u66e15fwdFnG66o2ecSswyRDMIsrsmZ2SLgWElsjo8/zGPSphjVeLLo98+z
         q59PaV5M2DCKguoczdi+56ZCn17X5oeW4dKMLi7IipMpr4WGi/Knzsdk2d7GHtVW/Az+
         Afew1GWAaILvrgjYEofnRxDPmKLt6+G4gF/bs8R7meuBCLe+LtwVk2Rc0+VqV8FmZcgF
         UtndVJnOSZZrLqLmOV2TxTmykSGdMVKQqUTFYfxQEXACrPKBqtJ8/94qGmNOuKPtzm6k
         0Gyg==
X-Forwarded-Encrypted: i=1; AL+hErHDbuyYdVX2mths+uJVDFH4BLm2MlVjbjzLMS2h8spX1EDHPb9FhGpm+Ok3dwGnjjUnaLLRQpj4a8pR@vger.kernel.org
X-Gm-Message-State: APuU4Z/qBpK/je8Ir+Kj12rdfe10n5G64NKMphtMttHBdzD2Ml2/qX+r
	d9nkGqqTz/xFg7d/2YWEFFnHCer+rtef1W1I7peJTkAkch5yftkXXmdxShzeVVHzlWt+GGr0fMU
	lcbiSvgimVNB/1x4DJUpC5J/N+4Fkp4YiufyrhuXERyWPo5JRi0x/nL4eCoP+1CbbpplM3QCO
X-Gm-Gg: AYBFou1prwGMxej+G/fhIGPQd/iQ8Kt5aM/VZ1XzZf3SSMr0/nQsePF5GgQMdmoJuuK
	reGwHIqOlfl94EDAC8+/7pjN5hfzt4f/nb5K2DdOcEt+uTrDMBOHYT93gttKVrRIoJxbnlD1zv9
	ikq2ZWtqn0eN5jxUTMwxNnpXSwfgYI8oINGg+EOewRj8HNefHSA4eO00k9wtOUMzP8+nWYgnzE2
	qYy9W/xTphdjVb4XYTkDwy111Xsgx99cu8zl3/DfQiDcC61tJ6kIA0CZhW9remgtNVCv23EeGcB
	f1ASk/bzJO5FMhPE4fgPO3ORdroWcFTzlM55NkpjignWOy+on+CB9o36RmpfRv53KK/Imtmk4Mk
	5NuFDu4Q67O+wqr3SxBkpNF3QX0Q0NTYGWzJtdaUJyKlzWMBULPLKS6ENoWxtWn5+vCk=
X-Received: by 2002:a05:6820:a088:b0:703:4766:16e with SMTP id 006d021491bc7-71ab51394aemr2703702eaf.56.1794630509488;
        Fri, 13 Nov 2026 20:28:29 -0800 (PST)
X-Received: by 2002:a05:6820:a088:b0:703:4766:16e with SMTP id 006d021491bc7-71ab51394aemr2703693eaf.56.1794630509016;
        Fri, 13 Nov 2026 20:28:29 -0800 (PST)
Received: from [172.17.0.1] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab3f44dc4sm3292269eaf.0.2026.11.13.20.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:28:28 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: glymur: Add ASUS Ascent QN10
Date: Fri, 13 Nov 2026 22:28:24 -0600
Message-Id: <20261113-qn10-v1-0-e09b2aa7ccbe@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Nj3cI8QwNdI0tDC8PEZENDEwtDJaDSgqLUtMwKsDHRsRB+cWlSVmp
 yCUivUm0tAM9Nwd9oAAAA
X-Change-ID: 20261113-qn10-29181ac11481
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=794;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=l4U55GauqfKYmjZblc8qA/udLK0JxGMWA36CD3J//LI=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBq9+NrWSVFdd/JjIwGhxYvFn43p2RAcFulnfnE/
 MQLXTcJj3yJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCavfjaxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUlbxAApG15epwb4gxWI+lZWZQGR32mhPoa4nWMHR+h/Dj
 VxlDYo81C/dHmQQzRtylEBS+cBXSnM9FVD+kFZN2kqP2Pj7urkYlB61A+0v49FFLajevWudB3Mt
 OLWkNaoJuPoq3YlxWfGNDSdtX6wKKDettZJwGlCLQ2cT3rPmVGV01xnaHHEqw/S2vzWaW5B6umE
 grRS8UxPQWuSnmshCUHGkB9YEMno0eAoYScPZr052I3h9EDYwMt7WSf7CfBrXmpCh2UvI1di+Vz
 3t3ReHCZ9EeywpidU7EOwOvDu9A2JRKHBqc47cDahJFoe1jldVOSW1VOAgoCqPjSzZ0dZ2Jp4IF
 Ipj7X7i+bz/Vv3HyuTjjFLVvvvzz0GTbnbiAbKTI9aT65zHyjaAymNAO7pq2FMsGuoxFT8ebo8X
 bvSSUh3eAPEJSmR3Fgul8KoWl0ag5AT+GoyUpupsrl7NTDoBVMy+zKamrUIA9ZUTwI5Y2/qjarf
 zh+fAuXYDG2ASVKHaAq8rJ/8EwIpaA9UNpXUftiv8uCZ23ZftcvVWdi032BDsT5n9OqYmvKvUh4
 UA7UoIqlw8LlGCXWhY+3ACwl50KGfZ1IAWzW71QRMqR/f3QFAeN1WET+6bPQqhVIWcOI6hFBjoJ
 1DHt3FFK7y/UrqdLOhMYonn/3uTvx52HiJ/WFIMQQcKQ=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: d89tiK1YXaX1ZsZzIiFYNDOdjetnmbID
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAxNyBTYWx0ZWRfX8HhrkOdpKcbI
 OQ7k10lzGiZVeGxqOgkUgnhuBKeYdSMnqawseONwAiaiet1N0mklClDFirZgKFRXfXk+3LoCCmJ
 8Pvu8kjk5v03NxN6VQLrHpuwxbpC5AKgNjj7EumQAnTBieacyWKczNYXewmCtJOPtB7Y+E3OsSS
 BkNBnsFq/+YTphgDYZNyH9jZWX/TTnqczsGH10XepGCF/jyocUCJFqxTJr5elCWWqGIN+jJNa8E
 NKVLIcJuuwonxvjblXvp08FIz/ANwbCqHDmlie3M1zVoDB9/TSaJi4EULIHppOVUPARQVIT4/jF
 ep9CBrlOWg7k9Ei57sVKqbuAAX/Tr2+iBNCkEr+1DRvWeqT7bIktdypf+D50R9ZWG8QQZWpPa3b
 VYahS35ybpOpg+eSsH0I2If5GuZKw8g+hDMYwbZEJkp/V9ibJDIKUKa203mYdGXyMvS4qrdmAm3
 vyMaIg+SHFi4jgsbfzg==
X-Proofpoint-GUID: d89tiK1YXaX1ZsZzIiFYNDOdjetnmbID
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAxNyBTYWx0ZWRfX8wbENp0pcre6
 zmTdNVoSDyA1yOGVVaENCzmFtYTIsuPTCumQO7dfj7CLG+4ztDgz9yJg0BKmV/uiMwv2ufsqukF
 0KYEFUBtuh8jsBhRG1T83wzldj28yjc=
X-Authority-Analysis: v=2.4 cv=AfAkjHXG c=1 sm=1 tr=0 ts=6af7e36e cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Emmm5F2WQI_e9zkRZ9EA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140017

Introduce the ASUS Ascent QN10 compact desktop computer.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (3):
      dt-bindings: arm: qcom: Add ASUS Ascent QN10
      arm64: dts: qcom: glymur: Add ASUS Ascent QN10
      firmware: qcom: Allow QSEECOM on ASUS Ascent QN10

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/glymur-asus-ascent-qn10.dts      | 670 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |   1 +
 4 files changed, 673 insertions(+)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261113-qn10-29181ac11481

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

