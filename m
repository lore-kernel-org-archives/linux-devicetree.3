Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FF43F4DD3
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743944; cv=none; b=NbhqCZPwvpJKT9mzmZ7TrK5WuZDZJINYLqm8LWcSvqWJGeG0brf8rjrxk0V2eEsSh42EoeQQEA+feo51WhqlO2ZxpP9SEuLGJJf7SyOad6DCKxB+pStTWl0zYyHhy8M6l6yijxNQHM/SktZQNvYTOt3OpuR7MT7aEF53rjkgGNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743944; c=relaxed/simple;
	bh=UQk6T/e+M8fBl5GMK7VHLBD6ptf7rBCi43/Bq11Knjc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NioVWi9qvDXuM0oRmLA4nbwMQilLRnkiEGIMDpHWV9TIqAogiloQf2ezt//WM6dx7ZdFb6k48LmHf6a1Ke+JbLOL079pOt2uRnofFD2fmLSWAgGmRbTlQlBflTFQAPOJNvZgWjBD4TkOnN7WROheL8bV/XUoY57anLvCnp2jmd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I8Z2izu0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=heRKCU2m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I8Z2izu0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="heRKCU2m"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAH41S1210823
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fa/mxCJ0sSQqgRriAvb2m9yZUEtnUivnYGU
	Unx2Zovg=; b=I8Z2izu04pZvX1xai/eyxobtyfAuAAFoxzzppf2nToFxpl2iO7p
	i1T1uPB/vJvD3SYIRK4HABLizkerVDw9Z8bC4YVRjN7QQR+o3EX5I6UvZibnFvv9
	P4QozwK+8sFEt31sJa/gpU6kATt/2JwlUUSxKNPBC+Ek7EH784O9GCVBtevT8RWl
	732L5BmW2IgSvXn8S/ON1RHS73RwgR5puWIDxKgsGQTuYtLgFuAtBilpHm1PtnZd
	ELr5sBrx/sLEba3EA2m9HYXl/dqBSUfXQRh2O64m9d0eZvqa1/eW8rrtNdOl8Yrp
	KJYYK3alXU/k81fg4SogGJYNMApWY8ftM/Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgxknj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:32:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso1462139a91.3
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787743935; x=1788348735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fa/mxCJ0sSQqgRriAvb2m9yZUEtnUivnYGUUnx2Zovg=;
        b=heRKCU2m+mZH8IW61iP0es5dO4YaSxOAdYTrSqvBZz3FZbhQP/1zBWhEz0Bqs9V+uo
         LQRZJvFtShRbh7LwAd+rQ0kwb+ydvBqdq+Fay9hZ1nOeGvDU0U+Cd5Uiuqv3vAXYgSUn
         eaei6g79ieMBJD6jcCZVlpF9ZbOxpI8MBo9MQUVIDb2Ob9PQH3PRb8gcYsYAXE3GJpMU
         oBokh9A0IJBwfuVFSvoTDLPJxRjHBax9dAkhKkq+hEkluyjopwrlgQjNs/hqaVibVUyw
         IAcXnYztShrHSBHsxwqEUAt7aBT7Usn+4KrVEwsEn/bmQ9epfVtSsSFWAuuJcDhZ4Jzj
         pE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743935; x=1788348735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fa/mxCJ0sSQqgRriAvb2m9yZUEtnUivnYGUUnx2Zovg=;
        b=RLx8E7PzVWwJkXtqj2dvVYuTwz6M15GYxCh7Nl9ZHJu18HMjnW7bd4mZCPM5DD9gAL
         OFnYWXs2vZam6tkBrNQ+ymFL4CfyEkLMrOzYODdnmpTwXcbaSCzjcvnMYn2f9Ho37PFf
         5h2wbhJdpgGjHvHdI9VP64jQ0cj4rllYj+H2fhuGJqNIlKog2wK/cSv9/q/8wO+ned3q
         HqmXsZvq8FNw3ArRs3KrF1yh+wlEKNbbx+iuyU29kToq5VTCCOVKyx3l6HCpMQoSbcKj
         Ubqdpt9ba0sC7+OL8TcJFS7FkN43Ps1tPprt6lb3fkKFoDoEMkrF/YbeNLuSZq65sNsK
         5dxw==
X-Forwarded-Encrypted: i=1; AHgh+RoVDnkdXUU+dGxtWLurCvN2IFLOGZrFcK4/zdrh9wUB23YaUiRMe1qylmwsyQknLeQBgjW7ejzXWOu+@vger.kernel.org
X-Gm-Message-State: AFuF++novR6n/EcisfHKKNpHSza8WqNrdiDj0fAcTsOqjkxB2o0zl35k
	vxNabplf1sJbbKGriW0n6YTWhk9ktv+HZiPTCP3DEGtOvRgbHwEc7XiFNhgWUkrQq4pdCEsWvdC
	v4Itb+CQtm4ltvdeHIllTIL9y183iUgp7lE0f2nRKQ/7SPnR4HzwIsYiPFIHrvmjq
X-Gm-Gg: AR+sD10kg2zTsfI9vRM66wOW2L7NQCOQyPZ5sMtx0FhykHtAXRmIxBqjQC3U7L4Bwt/
	CREEBq6pREGftkRtgv5kYbFAIjG9yLcmMNei7yN6BET3Zcha+fkq2cchA4Xn9t0G7LzjX8eyjPN
	1j9uYZ0mXWp3E/RAWbnlLYzjQj20ZobMgaONsZXZdvnheRycehEVK/qpEbHhXO4t9YTEKLcWgTC
	dJk4Dc0eLhtQoc9VbC5SYv4lWdnk8EReQVuJlaQ2RPGUMmizVbpNG1NC95nTHZ3gCzhGBv6XuLM
	f8c9VyPMbZjQoQbNC06TWKix51c71ZTy4xVVdrqUfwj/rzRDO2JMfUkSambRAZNO/jIHDtw1roM
	M3VHMDO8R2PUqR/W4dXTFpfuXbolVe2/1+F0=
X-Received: by 2002:a17:90b:4a01:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-3966d1bae93mr11394317a91.6.1787743934759;
        Wed, 26 Aug 2026 04:32:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4a01:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-3966d1bae93mr11394216a91.6.1787743934299;
        Wed, 26 Aug 2026 04:32:14 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b3a49bsm7748929a91.6.2026.08.26.04.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:32:13 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH RESEND v1 0/2] arm64: dts: qcom: lemans-evk: Update SDHC storage support via overlays
Date: Wed, 26 Aug 2026 17:02:04 +0530
Message-Id: <20260826113206.488991-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MqZiLWae c=1 sm=1 tr=0 ts=6a8ecebf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=A2BV8qJQPfFdF5fhguwA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: _sp_yMLMBsfXXnTq9JgAHX_lf9cB5Fvx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5NiBTYWx0ZWRfX+7b6VToY9IgB
 F9nLndZDUiKK3rSIMpoOIB7Zjj5BNvkE8yV272RemNTWmtg9++LkUznxrkSowh8JGR2scYZAPCn
 AvINYQSbZqPCUQ82OGDwM3avRo83mkNf5vOtQsWwwwd/dYnFd83gHe51/7s1jTeIO5Dt6PjrlNB
 LNJi6mSZVbAwcAu3pNqclg+Yz/1uVx6Id+fzcWGHWCmVf1q4ThB4cOvR2cKCbcC+EeNBSkk2FWA
 n4tJt7fBVHkK2L+zN0PX5radmh+HVhv55SfozCC+SYm0dePLZGuNmwWuZokFud19y7bD/lRNw2y
 lX7n3Tz2Mh0XFss+9fMgAbHxVVevbxanDvvblj2/Lh3ppQmRsBPpgt8KX3lvC17a+2Q8rDORtma
 /3MG92Jee3kbV++331BiU7GnNykQcgIjnXEGzxSfVB9WaKjSKBvfkDFdYSnRLPZTfNNBBqwxQ96
 Qz7ZeVUBqRWwjN/4www==
X-Proofpoint-GUID: _sp_yMLMBsfXXnTq9JgAHX_lf9cB5Fvx
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5NiBTYWx0ZWRfX0EmZpNIvY49P
 evTm+klaP+1Etjb4gEgvY9gE+s8pXaNjQc5TZPejbXGQdH1tGgMfHatTeFW6o2Fbjw4kWkytPYx
 Q0hFdJxFWkl9l/T0I7wf+r4myZuEBDY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260096

This series updates the device tree configuration for the LeMans EVK
board to support dynamic selection between SD card and eMMC storage.

The LeMans EVK hardware supports either an SD card or eMMC, but the
interfaces are mutually exclusive as they share the same controller and
resources. Previously, SD card support was hardcoded in the main device
tree, preventing easy switching to eMMC.

This series refactors the SDHC configuration by:

1. Moving the existing SD card configuration into a dedicated overlay.
2. Adding a new overlay to support eMMC.
3. Updating the common SDHC node in the SoC dtsi to include necessary
resources (clocks, register ranges) required by the eMMC configuration.

This allows the bootloader to apply the appropriate overlay based on the
desired storage medium.

Monish Chunara (2):
  arm64: dts: qcom: lemans-evk: Move SD card support to overlay
  arm64: dts: qcom: lemans-evk: Add SDHCI support for eMMC via overlay

 arch/arm64/boot/dts/qcom/Makefile             |  6 ++
 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso | 64 +++++++++++++++++++
 .../boot/dts/qcom/lemans-evk-sd-card.dtso     | 25 ++++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 16 -----
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 10 ++-
 5 files changed, 102 insertions(+), 19 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso

-- 
2.34.1

