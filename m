Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F42472786
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034384; cv=none; b=uaPdygbWumwDDYbqLQ+uKrQf0sWFaGV3IWFrIJn0P2czlwuYhTIazDEjVvKPCbuy0uy/XB/qXisfWduzirYhV92rGfSs7qcaudqGsdlTAIFCGYLy8XRT619rDHyi6FNrt6Yp8F/yjrgS1Vtk220sB0rPrJ/aOlVRc0Tm2mvbuNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034384; c=relaxed/simple;
	bh=WgltQu4rBO97NE7AGv98oHbaEqfGh3fT6SDmoWy7vMc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VbulV51MaCQlY/jFAwa00TlIZBzZ2XM8qfEHlNa5XVekkR7IhRkE4Su0HoGMQgpvFNGi5cXYdmuJZho0zYneXCRxVylpmVj4qbYRTUyMxrgbDgIhG1+uY9S3siwJzdXqg7EfWefjweIYSK1u8yWb7olMSLlhoJhYnkn9PKxymcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MTKcjYQm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZeA5Wg8k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MTKcjYQm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZeA5Wg8k"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBmlwh473855
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rpMhj+1GgnqY6rP0XzyhWl
	Qv24rH02IBFpIK/76iZP8=; b=MTKcjYQmbseSAL/DqSWgq1Lcb4o3w6tbZSi0AO
	vxa5eDqHXoy4mWAi/eit7XHTzCCy1zAQZ5H+I+70riSFAZ3JAB3VtZLhkycLoqJU
	ya/PtyDM31WSRMhZSLXOKKaJ8lox4tKpPvIw9JHipuRVprd0eP0nYlKT1IsUy0U+
	E8eUV1mNC89Vn0cSNwZFg9gfPPcxAvR0w6Y5z0/Xjw3V3bhDgzqdhSLF9BMlz0Oc
	StKq4pYcsni5wKicabs3AW4OVIkA0siW7qve2gF9TQrPBklat+gj+1dPlKtX86YK
	wIcjUQFeZ8yUfEnCqUOPpGzxjxHX7Yh87lLQP0a/1lxK9l1A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmjq0a9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:06:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0408254aso10974271cf.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784034381; x=1784639181; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rpMhj+1GgnqY6rP0XzyhWlQv24rH02IBFpIK/76iZP8=;
        b=ZeA5Wg8ko+R2dpL7ZyBjFim+STd/e7vEkdjAN/EvWLX6SuIEzbZ3IHjhz0tu2uhliv
         6VOQUP4UmhQtPZ3xnp19gmKbfxsGVhcxlgf0wiHlD6vUxwWLYMJ8+fG0tYOTzusa1vBc
         BqeqCyWTWKfGE15cJHPHqqsMuWDNCaYjfRC8cs8Y5DucIKzgqc6jovrAgsvqFzCi6b4u
         WcBP6QSbK8kuXpS6PydRaqFSChguPzvwoW/P+Bi4fa+nMK3W/R8dLIFX5U0IwpuSwCng
         A2N/e47hxVjA6/UlYXd6g+aD1nZLO6QF63PFfmoIlPepq9G4VWoV1zyFnp52Xf2sBvG9
         f+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034381; x=1784639181;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rpMhj+1GgnqY6rP0XzyhWlQv24rH02IBFpIK/76iZP8=;
        b=IFwVFCBE0uxW1dvwGDCxtYOd0tDukf1Gw6MWEXt5PERtB2Zgqq6bTlWox2nSuWN7o6
         N313J69TUJUCJRnI5xKH6r7PHssvRzNfIMaErzeZl8Sba8zFhyi6Ys4d0cwGLTLqdBBo
         RGCsWuV+tg8odXOSJj+6OXCsyRDkIMFfwHSWWgda5png6kgXffARq6X8q9tCbVmfmwFV
         aVsjxCQjvf00kmQV56Wt98HAcKAUo96wGR2GIpLJw5eHCs7Cz0L4c82IznDr5jqcE6vm
         Aiy7PIbwfK2bkdMw2hG6p8xrgjkrie+P2yFyU3tZ8tcdYDq425ZD5aUbQkpkuT0hlUIY
         4q0A==
X-Forwarded-Encrypted: i=1; AHgh+RonqgUGtf3hjrsaPC09SlRDrWSVXCEVW+or4FpRc9gN+7KZrRvUrp2zNAVT6BQhs6x9lpn0pJ7jrpXR@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcq9016eYwPDaAzhOA73mbQN61WWGxsKlG+BzL3RjwRsssFLuu
	rUWq3+0AZcU1BpU28vZ6VBPD7LKf/3VhVdGCa7ohuMJeyHTjAoyYPLRo02hRBaShxR85Qk8YKKl
	1+xZ9n73vXYMr1iJPy9FtR/7wNsCRf859W4O3Jb2H3HnZAW3TNcjrBhU4clySJ6yr
X-Gm-Gg: AfdE7clZGuh5Yx6g2ZTBaONsR/p5tp+daX8gditTCaq+GCXEZLb7iImBeYJNLRn/1ij
	IDlVIK+1WciJdMOHkIp10aFMAV5lXghy3gdY8qwxE92abrinRi5FMEwJHRmCOEV3X40rn8iy0jw
	3tSTOfeeZ09HlPZ/TGQoYfvp/J1CGQ3Su3cZVGWqBgNtXwiuLraChq1kdohVQ+Td2xPY36g+0q6
	XZ2E6GpoZ01hdqctJ85OoA0O3CdwKOJm7x+eEuCb554qSb4qSqbhneWnUPlkiKqQY2CLSYYYif+
	yqcyE+S3NN8JGaVfX1r1q55OwL/a08TqzVvgl/ea5DijrysC81g7aGsCtoQ/J/HkVX6SixV9vQ6
	kxV6Oq8w+IGBNtTI=
X-Received: by 2002:a05:622a:95:b0:517:c65c:4987 with SMTP id d75a77b69052e-51caa128585mr180200481cf.22.1784034380927;
        Tue, 14 Jul 2026 06:06:20 -0700 (PDT)
X-Received: by 2002:a05:622a:95:b0:517:c65c:4987 with SMTP id d75a77b69052e-51caa128585mr180199951cf.22.1784034380380;
        Tue, 14 Jul 2026 06:06:20 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f47688f29sm6323742f8f.21.2026.07.14.06.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:06:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: eliza: Add CDSP support and enable
 it on MTP and CQS SoM
Date: Tue, 14 Jul 2026 16:06:07 +0300
Message-Id: <20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD80VmoC/yXMQQ6CQAxA0auQrm0yTIiMXsW4GNuCNQo4RUIg3
 N1Rlm/x/womScXgXKyQZFLTvssoDwXQPXatoHI2eOePri4r5NHwTf0L5alLxMiMxDag8yE0XJ8
 okIdcD0kanf/ny3W3fW4PofG3g237ArHhQhZ7AAAA
X-Change-ID: 20260714-dts-qcom-eliza-add-cdsp-0288fd79c8c2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=915;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=WgltQu4rBO97NE7AGv98oHbaEqfGh3fT6SDmoWy7vMc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqVjRF7g7vH7IkSslpwwpm7/FtXO6GBekSwfL9S
 w58Y8FdBTiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCalY0RQAKCRAbX0TJAJUV
 VibKD/wPoE8o2OYe7esii9RZ/mP8uhAPDBv92KXNwLrG+x0NhtpMZFq35bMZV3mjdk7AIpggFB2
 E/mInJKtOxrYVrIbKcIa8n3XEDII+BhbHUqmdm2xgLXUMM8TF31RTUDqJOBPMqewUYhOqLpN3xf
 Jv3qso4Hrc5OJVFpjnly6EE5ODXgpFIGrmWb5CU12cRANxpOopqsyuOhkr1CjSCSXcY4UaQLLEU
 rN5JUpH1w0uN52G38l70TmScwujDVoBDtVceDw6xo1Xfb2fVGl5zDQJ0tWXb+U4x8YuZoTl6tLe
 KQYqNwdRB+u8CJWgzTq/WujZYV2LAjaxRIStzBI4VuAc1XwIwvlv8+8CykhAdAuTkSoOdIu9wan
 lYYiK+4rMVBXQ9uwoeKeZ9j51/O4ZN4NNc71K7ZGKxJaDwxxOA6/t8Rk75vMPkTESXJd1KzyCru
 s5bfn1l0iswd3px0A+PXs36te3JOkvY4vVWt9hE9PNEGc9UOKX6dn4Wtbk5dH3dqzarcj8Tx5KF
 idQXaHEhqzTwcd07lFXIhdgIXYZFnVL2GByJXNp+92yWHa3nbvR1myFyC9AWphvfyPhewU8swXD
 L8GLhtx1MZDYkZ48G6XPeR2EiSLPi8MKau2tm08Czfc7+TrI52eTOx/MCbhrztG6CSGWMcHIcdu
 X2ULzS8BhK0jAxA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=LqmiDHdc c=1 sm=1 tr=0 ts=6a56344d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GS9eBAP2CcFxjFPammsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: s6NGJpRARV6CIoLkhzdktGW1059tC2ny
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNiBTYWx0ZWRfX4YioUAJPRYt4
 sivfqHYY29VGsHnC2NypsAtgVknZPb1HemYNHjFEimfNxBoPd9OMFIE4lyafF5V03Rr5W4utIas
 axa99+PXuiKHqa2LmWfv78JI8ZqqfJ4eiWgblBxKLwZxljh7O+oWtqngWtgmo+x2iJBwgDgsFPO
 NmpUHqVUoCEzYQHg+A3DKR3Zbl7/aT/4kO0WTmtQrHjXGJvZBIK7VW0ko+wqqs4XW/y2n5fD92v
 9LH/uJY/kW/GwPWwNJcN97XBORjVKy/7oCEXKxlUoKTP7oNwSIEena+lejElQ7Eq5+yUG5KU1B9
 cMPr36DZkccqaF4oUbr/dewaxHx58ORtMiV/QT7boUawbl7+noQXJf442o4DMDpy8SrajRL5zr9
 RlLffGfRxx4O+JAjDjd2v/AfyweE+eaTiNOFnTbDJGOsEPgLmk92FMPCELBEUH+BzrqFSPSgMJ1
 kF9C8KEOGZLWHakr7yQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNiBTYWx0ZWRfX4V3s12lKFCTW
 bLH88ekk1IX1v2SWoOBTSx3viswBhu/O9bWIYCkuc3AJxXHBVBqAJb/zQ7Aa9aoJ0FcQ3EykrLz
 hoNqUVzy+hyWY+0dqp4TMdBSWqG3b0E=
X-Proofpoint-ORIG-GUID: s6NGJpRARV6CIoLkhzdktGW1059tC2ny
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140136

Describe the CDSP node and the related SMP2P, then enable the CDSP on
both the MTP and CQS SoM.

Driver support and bindings update are here:
https://lore.kernel.org/all/20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (3):
      arm64: dts: qcom: eliza: Describe the CDSP remoteproc
      arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
      arm64: dts: qcom: eliza-cqs-som: Enable CDSP remoteproc

 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi |  7 ++++
 arch/arm64/boot/dts/qcom/eliza-mtp.dts      |  7 ++++
 arch/arm64/boot/dts/qcom/eliza.dtsi         | 64 +++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260714-dts-qcom-eliza-add-cdsp-0288fd79c8c2

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

