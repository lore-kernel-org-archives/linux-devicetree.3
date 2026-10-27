Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101807;
	b=ZeNwMiunHjEeFg7jhwsMZYAnwlAPbgzZAqCmvZ9PsCYfEDPnH33S112oZYIENV7tHunt
	 AUwRhvA+KspUIJg2LYfmWYUEYax7EvoqrB8864SWEcc96LVfZz800rQ0Hul2f4Tm6Gs8U
	 IQBo0YkeK3c7/Zv1lCvFdiwNzzk1z599BtoneyYag9NiTTzWFAAKy3NmbIKr5BO5+cWKy
	 U/aHCkshrBFTjWOZOmj3cAEStO+sqLHvhjjLXnJCeWaKbTXqX6OJr82WCarTJpaGT8E5r
	 7R4sKje9eN9mSNpFWiNVcfckHjpx1qDIh7zVIFcvftlcl1FhewjRrDGTSHOPkQDa60Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101807;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zIjrZgR7dp+EH7DmWZ9zl/0I86QLRtWJ52RJzKOEy+8=;
	b=kDKY+I6vOgSQmqCS19ZFkXw23fYAIpRiK5YD/68ZrJUoc3Mck5NPnUIMfUdHllPXKlbH
	 dIeadx6BPnIwutB5wDzFd143RpmZCDMoprzgcxtZ8olFi5SnEd97IZ8fx1IdJZ1gMiNjj
	 kbHJX18PUjeXKyOMbJwnSM8LFktELkHoepmNlUMSx2XOqnducl5UNbcII2DiXmRrdncY7
	 7dGtXgaBszsV4xBgqMXp89Yp9xo7ubQ28c2pkRxMKMPuXktjQsn2HU93BARI1vK2+cLXW
	 V9OTM8tbKXY6PAV9dPfQrpfw28imBR6J4P1IP3UWQ3GrWKiLvv+hLD/Xqvj6tZlMNOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GOZCGZxN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HepyyvFZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6263D606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6263D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GOZCGZxN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HepyyvFZ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeJct1427419
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zIjrZgR7dp+EH7DmWZ9zl/0I86QLRtWJ52R
	JzKOEy+8=; b=GOZCGZxNGVkU9lZgDezE1pEQgUEGBimtTwmG/4y5B/BnRaXQMke
	I4RDEtnpt+Akb57O49mMO5Tx+v71FpqNDy314mWqaGrpkFH9kUu0U0EciWOGEHxh
	5qBPi/IN/0+UAz8j8IzfFFZ4CRNJCFwvOOV9bxOoCvyhwQfjHNG53t+0GmLUilFb
	pqzkx2k6UnGJukrbzVlSZ12rqAXyByeJXUMBbuYkKVOVnJf7UYG37gk6MKGyfhop
	FVdWn0T91xw4ZYFDNIkuypOxKs4yKTEmG47Na9OtmM9MNiELK5B6G56w+YVbAn0r
	fe0lQgLYbW+qKUcyMjqAH2qOjrtA5gAvSHQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmbdqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:50:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c3c370b17so6981688eec.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101805; x=1793706605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zIjrZgR7dp+EH7DmWZ9zl/0I86QLRtWJ52RJzKOEy+8=;
        b=HepyyvFZzNrlUQmNZ3kXMsSlXgrMnwNGft5UYhas9CUJojJ3agOkHU9hk2YK+nulu7
         D/i4Lx+KnVW3dIdssoUHQ+BaMYEygsgROfN7rK5NrNkLRH6GbQpl/HgMsHOuDh3Rdy/J
         97lh8ERV1YG5D3LLQnYqM/CJitOhvYBg0If8T5uXaFN3NlbHeCY2xSFNKt3lZCrhOfcf
         Sy5SYEoEI8pkRcJ806sh/ym23vmbY1qIQCBXs5VOw3LrD3NKsO5TZE7RBqTL2feqX77K
         sbRAacgQ0mF2jeopTvSEEqwyI4xmFtwjMeTeaWPEhasl//AaEr1RYbu09UpR2cOaRWEF
         +xrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101805; x=1793706605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIjrZgR7dp+EH7DmWZ9zl/0I86QLRtWJ52RJzKOEy+8=;
        b=pun4MX58jYSMTlvNZHpPXD6xqTJnkU2KfHozEUaWiJSHZidvfH/3oR/fc1LVWLcsvG
         2rS7xKG5SAwnBMWTr9s/1oMbvJm4H5xcFX78inb1MLjj3b+1PahqWCEijy9PqTldDMK5
         xcbUfr672l1fxE7SEdctCQqtG7uDIL6tIQELtCeytvfr0+aIwtsMko/cV8tbJNwUExsF
         waLM2GynZ3IJ4VfwUgUbsSXRwd3nJeLgPeT8ZzSxovEFOiTBtobBnDZhQqXdlvX+upzv
         owrLMZHCIMmsx7md8qCWmL3pqgYI4SfHBycOM7l6peUPb9DLOelb1WqyshLKrWOVNZSK
         2Gyw==
X-Gm-Message-State: AFq9FYLUQdFGWnnrY95MG1rxhq+F//5/piZIPlORcjPQCBHIvCQhKEeb
	17xKaRHDypfu8gBpbM2GvkvFmf90seIG/5sADjcs0VTpSb5CQ+lTUtyPcM+Qqd0SHn8bChoQtI5
	dCHIn+rPD/ksZC+kkNVOc4hLRt9EsSJB11ZGKiYbdcM/c9NbVcemElVDIg6ZFizQz
X-Gm-Gg: AYBFou2gBL+c4I/V6n7nTzfEiJhfStfcWc1gW34i8s7C6qJBgjmDo0rAxyg9nrfJH7A
	h/qRcIZjBfj/Jte84pd6oIWYVVsUAd4gA7+M+sF/vTcE9VwH5/yvD4YmHuGnS55UmEPD7ILs6oi
	q/IHiRhalOUJQQgKO4Wmt9mxHizLEfXJr51jfHxdsJSQf52w7bh/00mwENAtJcs1Y8G8fH25k0q
	wo4PaoDruO4SthFipyBfr42UFe7qjqsNK5lhn6ihJCO1ecrb+fH2R+DDAMQ2T/5x2DTon3SD9ft
	za+KQYurMJa7HYPhgzXyphLttdOu+RxeMElK8SjX2fUaEOQBbFYSRNLTDHXoHPHt2LU/uhDaUTh
	XZe7nBz9GrRzUFmAHK8bXzXl7D27Urd7o2hNJMvTQDaEZJZeMtjbiKYEbjzqqYyZ1wZbLZk5bDh
	U7ayjvpZlW0AwY7iqdKOWnr8iJdk33vg39Ai1KzdCBkgtKgL2wamFdKUR/TsHK0gQuZFbg1sg=
X-Received: by 2002:a05:7300:d18b:b0:360:34e4:39d2 with SMTP id 5a478bee46e88-369e8492585mr13175248eec.10.1793101804469;
        Tue, 27 Oct 2026 04:50:04 -0700 (PDT)
X-Received: by 2002:a05:7300:d18b:b0:360:34e4:39d2 with SMTP id 5a478bee46e88-369e8492585mr13175144eec.10.1793101802250;
        Tue, 27 Oct 2026 04:50:02 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm61918825eec.23.2026.10.27.04.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:50:01 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Subject: [PATCH 0/4] arm64: dts: qcom: Add support for Mahua QCB
Date: Tue, 27 Oct 2026 17:19:51 +0530
Message-ID: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX6cFbxiVlZhWv
 zxG7qRVb4invlROqUHO2aCaKHJrYjwk1O3wyHhkJcN4pvx6XCmAwVIZDjUCtHCVDoZrD0pG4axo
 4OOwrp+gZz7cQzMdxza/uRMTtBZdyLg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX25M8CckNZmek
 r0l+zEjgqlGuIzaxxmcH/sVnosQiLpnD711d8bNJaEW8TtjAN3fFylKmWP2yCGT2RDW9iCPf6FO
 4OslfM+Ph5WzKPIyc9CihfMTbRQ+jM39lvSm8zikqgLPkrz1BfigeSSotKHfe3MIxxWrpiZMbXz
 P2FA8LS+XCkRTDJuCjnnBuOEiJsbCv+RG2Ucuh3R+XJRxZi7V1spMhErzj2mOvF56BSST4lnqvm
 EH9atWgAhb2DCwMFjDZNgFalqn2/2MI8+ShaUaCw+Xd5ALuEspsBP4X7mfwUDjnHYqKABiyt7Ss
 ErLSuHZ8uIwhJceI1iuyVi2Smv4a0wHicG4XTbFeO2l7F/xZhKwU9JyYUoDeEPuMMg4vIum0Pao
 Wl9ecd8Gg5+6d0hEMKo/9Ki1z/a0icYXqZHIdB+db86mECNqcfzDXyGwIODKHseq7eAuPCSUSrj
 M7SGmpEGTTh3eSUOOTw==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae08fed cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=LhmUFbnPgsWGGw1Yd08A:9
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: gT2HmwJVcgdYo1vr0lMUY3fmDtz78Y-T
X-Proofpoint-GUID: gT2HmwJVcgdYo1vr0lMUY3fmDtz78Y-T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1011 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270047

Add initial device tree support for the Mahua QCB. The QCB (Qualcomm
Compute Board) is a board built on the Qualcomm Mahua SoC. Mahua is a
12 core derivative of the Glymur SoC.

Unlike the CRD, the QCB is suitable for compute workloads,
power measurements and oscilloscope-based hardware validation.

This series adds the bindings the board relies on and commonizes
Glymur QCB and Mahua QCB before enabling the device tree for Mahua
QCB:
- Document the qcom,mahua-qcb board compatible.
- Add Mahua QCB to QSEECOM allowlist.
- Moved common device tree nodes between Glymur QCB and Mahua QCB to
glymur-qcb.dtsi.

P.S. 
I tried b4 send, but for some reason the coverletter b4 generates doesnt
detect moving glymur-qcb.dts to glymur-qcb.dtsi.
Git also for some reason didnt detect the move by default, had to use
--find-copies and send the patch using git send-email.


Gopikrishna Garmidi (2):
  dt-bindings: arm: qcom: Add Mahua QCB
  firmware: qcom: scm: Allow QSEECOM on the Mahua QCB

Sivansh Gupta (2):
  arm64: dts: qcom: Commonize glymur-qcb.dts to glymur-qcb.dtsi
  arm64: dts: qcom: Add Mahua QCB

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/glymur-qcb.dts       | 667 +-----------------
 .../qcom/{glymur-qcb.dts => glymur-qcb.dtsi}  |  28 -
 arch/arm64/boot/dts/qcom/mahua-qcb.dts        |  38 +
 drivers/firmware/qcom/qcom_scm.c              |   1 +
 6 files changed, 42 insertions(+), 694 deletions(-)
 copy arch/arm64/boot/dts/qcom/{glymur-qcb.dts => glymur-qcb.dtsi} (94%)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-qcb.dts

-- 
2.43.0

