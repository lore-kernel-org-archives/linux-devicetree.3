Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C18B303CB0
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778860900; cv=none; b=PAkvOX547Qsa48lQVVydQm0nkW9lyrW7FlMLBIar6/+PeobI0u4tQPFCnJiDXybL2ZHhI2ZPa3R7Y1bzp4Mv0hdtGTt+7ECNZH/6DpAKwvrekZdIX8rDWkgR2HlnC8JZ0rtgJQjh/zMex2EOW3vEqe0LxtxnFuhNBx9h+sfXLo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778860900; c=relaxed/simple;
	bh=qHQiyeq3zWEjZvB3X4nGiyc67vuVPOFRQHj9rmnRUTw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OefmrL04h6j66moqY3ym6amiztAoosIKEs5Bh1w4o2+yTSdIXcht9oe1AkA7SpgjrbJMJAsAoGwuygBZFZdpLSfWhWtZBx7+C/NkGkmOMM5CVhk0USZfLWnfFsIb4A3tl9AUeSLNjmDkbNibtCOp2d2vipCivoLNdKqKHNQszpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QAVrw+iI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GWimycjB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QAVrw+iI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GWimycjB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F8kZrl1714932
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KmP8Lyg9y8/mru9ixQizRn
	WZXXyQFe2wq5aSUGD9ynw=; b=QAVrw+iIH05xByV2DLBor/H0rZ9OFNGkWk/gp8
	Q7Te/Gtvzh78gl526AXFxdgoqupwEst1QsCu02s2Sue01YRKO9Aig/Hb21rR33XX
	wbDv1lWcueUx2gQSSiFKQN68BsCHYR+cQmbTIO6rP1qAlPKEX4EkDkt/EvNdBZ7p
	iRJtT7hjPQ/7/06yudVCTikhCxrXkI6JeVkTbbZC7iGyI0/efR13QjgBS7UR72on
	McFm/x0FzGJXHECt9l1Cfs5Agf6o2eCV5KZfKVyLGpYkm6TCMNEudumqtggWn29C
	PchsJrRqaBMFsMU7cUfZbVSiDrIb7GKrQoaM/yu6icxzqumQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5tyxtpgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:01:38 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4346755f7dcso12594214fac.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778860897; x=1779465697; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KmP8Lyg9y8/mru9ixQizRnWZXXyQFe2wq5aSUGD9ynw=;
        b=GWimycjBEFfLeA802kV9UUSuFkbIymHQ4iyd/FTeaTpOb9LAXmAt+PybCbhboJp6y+
         qxVN02nxicLOLUdnstQkkmM56TGfgkTByrozRqnEZS4qOgkBPXS5ZHK4e4C9dq/Hhm6F
         AeSsoD0Ad9WRh3/Npg1vZJRe9IuNFrF0M0QJyrfTSMro+x2IYvaHKPDBdWVUFX0iSKIj
         Sp31d1OlZNqT/vgJn0ENORHwzIZDHPyJpD8tZR318UTjCCoYngDmvwRIOWlGCs+CNPFP
         MHYp0WVVET8N4uBj4r54y6IBgVjubRzG0QMQfx/SkN5IY9kuED561A3a1W91Cd77vFzn
         nA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778860897; x=1779465697;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmP8Lyg9y8/mru9ixQizRnWZXXyQFe2wq5aSUGD9ynw=;
        b=Y83FodHxWEVMOwjTIQjXO/Gg6ZbBco+s4Uf8efClA9wLHDUDvxOYzRlQbJX2JJVLqg
         QJTxcG3VmWBWut8Gg9uD/hJqQ+SN95jk3iuiNxhr8xOkYp71n09DEC6MHZFN6+kh0nNR
         r4ffKSHDWoQZ+ijbD5N5sFp1bXkLpM2EFvy6g3BQHJUeOQH3rXNqYjlhzqkbOwAqG/v5
         Ou4glBzjQ4kYLGFWFFONYD9mNzZ1dZanPeYZ/nqK4e+2t/BKxETAsVYwQ3ltLuNkSMxp
         fhaRRF5j7c1jjlHcKoPhBDwf1Hyl1WR/Vd1GwPo7pqy/hAXqrYzKkBXmsEPVOzvsteJf
         6IQw==
X-Forwarded-Encrypted: i=1; AFNElJ/WIMYmyAVWH8AiqvxwSiri+QRoqHd181Tp6EC4ttzNrYlDhDRkGV9mh/DrD2eDO42JiZd0+aiYwT9Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwnAyUaW+6fNc4rxPoQQeK9qTlkL8tu7q2z+tfxTe+pB1VayVWJ
	P3C6HMfiGdaQfFzUVJLprMQ05m4MBaegfxxYMa46Hm1isp6MiomC3w+chC3GaPyIeZPXpBAvzJl
	dCVOr7hKoephIaFulwRndCS/K+jtH8wUH8RlO+/dAlkGecFVvc739FMwWSV68dOlN
X-Gm-Gg: Acq92OEJBIzAVhuWZMXMs8YJ/jtjEWW3erPx937Wrt/q1aMLDkG2m7rZEzIEPMnCNPl
	8vaa8Zvoe4oZUrSsEkEY8HgmHOEaqKhA9dpSGORXzzvi0tbui/M3JT+cQwGZaUzTzQ4E+OalQAI
	6am1Icek7B3xmXfJyjzsbF6VWJmf9RQ49WSPW+G/DX5JfK7QlMKvwARK/nV5wQX3TYc/vhWLuJF
	NALa9z7UOda6hpo0pBMYq6x9rar4tWJYPdNHsfhwmIe3PL9W9RQPMtZCpAIUSyaxfSRu5s7no4l
	FrhcQJBcU3IulOAHatuTYJkeCkbZ3/aRmwnOvBA4yl45xZQCdX3pYw24+MbyyWe3ggao0A890vr
	7au2zzalzLqD9L246nd2RNzgjGoET/dpU/s4MIPQ=
X-Received: by 2002:a05:6820:20e:b0:694:9bdb:596b with SMTP id 006d021491bc7-69c942e59f3mr3268092eaf.17.1778860897253;
        Fri, 15 May 2026 09:01:37 -0700 (PDT)
X-Received: by 2002:a05:6820:20e:b0:694:9bdb:596b with SMTP id 006d021491bc7-69c942e59f3mr3267996eaf.17.1778860896410;
        Fri, 15 May 2026 09:01:36 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6449sm15135743f8f.37.2026.05.15.09.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 09:01:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Add Eliza CQS EVK support
Date: Fri, 15 May 2026 19:01:10 +0300
Message-Id: <20260515-eliza-dts-qcs-evk-v1-0-7169d78a33e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEZDB2oC/22QzW6DMBCEXwX53JX8A4TwKlUO/lmnboNNvIDSR
 nn3uoRKOXCc1c63M3tnhDkgsb66s4xLoJBiEeKtYvZDxzNCcEUzyWXLG1EDXsKPBjcRXC0BLl9
 w8KIWx07Itjmy4hsz+nBbme+np6bZfKKd/kDbRsbrXI5NzzVmNCHYNAxh6quItwmeB3nHXpP01
 TpWim85tKMRZjLQoZdGGO6tUP3S7LrkYcudhv8agcaL/oa2dqist51ueL+oPXcj5GYKccJsU4y
 lUQngYAhEIZ6BnLUC6KIXhJgcQttwybUyEq3tF7mPVS8vLX8Dh2Y+w6xzgccCTxmB5nFMZeC1Q
 a+crK1bgafH4xe+mkaiwgEAAA==
X-Change-ID: 20260514-eliza-dts-qcs-evk-7f1419812659
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2896;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qHQiyeq3zWEjZvB3X4nGiyc67vuVPOFRQHj9rmnRUTw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqB0NWKLJwv9LFnz6Tn7UvZ/IbmdmJa0G3kJZpV
 1dbTW7oKl2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagdDVgAKCRAbX0TJAJUV
 VqrqD/0cuYuhrx6MEzgHf18ckO0XFRCvqfOQaylKiXIYxc0/pbDeGhgvp1eoch9Px0+oRL1KrWa
 eiLrzFF3vd6wb9v5YjYHLxhNR5uqo5h66thDCumgLGsUFfXtGQ+GqtG5TEnFL9AIGY3ryd8mKHQ
 ZMcIkep29jU+LrHtpIwbai0TpZXHpdr4TZCHv+O3ba2/SNf445C5cPNHNgnwCQzg2/JAqapeWc4
 zWsbHmBwu6vhTVNc8L8VIqsLuytFMsxqebXyQHGxrxAuyZhzsCsTF8mvifRrhDJWDYOPizccmMf
 A8MCdPLActT9nM0akqzqD6DfQO3MgnMP6omTdBqRrVN1npf/XJR7Z5BBew4KprVXj+YF11uxrtP
 8P4iiyfIuemeOl+CiORWPRU1wsaaQx4GXafffFttfmna6LqYoObU7x1Ulypu32QX/Clg3dBn3Z9
 /m/h1z5jb3T7nlbYUnGW56DfbPpQbpQQmEeQ2uwOqDaHqQNEGMZOMFWTzSCCGnI4Dv0LRepII/9
 9jD2I6zp0n6Ln3GNygLgF9K7Imj10J/EdOK6ZbzSdlhpeEdA8/bsf1B2SjMD/Cqed7ymiFuavFy
 TSmU4JWE3wiuX2wmnmiY0xKSQOmhMvjAfDiDfg9vHxeuULOKTgpo13juBjsYa1qpLOMufHQ/OBd
 iiPO1sFbaqidigw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=dMWWXuZb c=1 sm=1 tr=0 ts=6a074362 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g0EI524gLSW0X4iSaSoA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-ORIG-GUID: e_AcpKt8cV9UhhdvVR3zbAGwK_5NYnW2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE2NCBTYWx0ZWRfX0QFLtZ2mxj1A
 h7d9ROLcPf2Zsm+5054WPPjo+xspIOHsCDxVPiByC8o41Q72vivLRx85hk7iupJYl6ayx1GOThS
 Zr9jGAYwJBcShEM2+qXXKTPAewW/9XPYgol1tCg62z+lzehrgK5/ZflV1FyRzwBRQ+ciJOSd3mw
 dkB0+GoV/rDg7piIZTrDDV5A7B+2SnWzcP04Tf3YlarkGkFwBVYRTHDbzc021rZ+kJmUMWDP9z9
 feMV1djpMysmvyRm/G/doeJg76DNnPKvwGxw2myAkCrmiowenD9Jar47lbfMfe1Iw/bcXbyobAX
 34MYequs76rsVpH9Pz1Xv+4LdyON9O94TOCnBis3T9KWIlEMSH9P415EMSC9RcIcA4meHnQz3YD
 dM9ktNKE4Gcad+OSvKGmLahEg1WiMwJZ3pA+J+OOfDR/RmJejlDaa+NS0uuQyopKx6J4L8e60oN
 h3IacIUdq0BSopmK5rg==
X-Proofpoint-GUID: e_AcpKt8cV9UhhdvVR3zbAGwK_5NYnW2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150164

The Eliza EVK platform is built from a reusable base board and an
Eliza System-on-Module. The base board provides connectors for external
peripherals, while each SoM variant provides the SoC, PMICs, LPDDR, and
eMMC.

Add support for the CQ7790S-based Eliza CQS EVK. The series introduces a
CQS SoM DTSI with the board clocks, PMIC regulator supplies, ADSP
firmware and eMMC wiring, then adds a common Eliza EVK DTSI and the final
Eliza CQS EVK DTS that combines both pieces.

Do this in order to be able to boot to shell with rootfs on eMMC, on the
Eliza CQS EVK board.

The board compatible strings are documented by the prerequisite binding
patch:

https://lore.kernel.org/all/20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      arm64: dts: qcom: Add Eliza CQS SoM platform
      arm64: dts: qcom: Add Eliza CQS EVK board

 arch/arm64/boot/dts/qcom/Makefile           |   1 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts  |  20 ++
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 388 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi     |  20 ++
 4 files changed, 429 insertions(+)
---
base-commit: b462608de92a7cac450781f9d8d4c7cf3ccf82db
change-id: 20260514-eliza-dts-qcs-evk-7f1419812659
prerequisite-change-id: 20260330-eliza-adsp-usb-8ef2b1b0fc13:v5
prerequisite-patch-id: a457d339aa64967766ea88eb05aa65a4747e1022
prerequisite-patch-id: 04af1479b04d515ced835504144cf09381471b85
prerequisite-patch-id: 480c23fcf537d5ae69214f0aabfcef11418d37fb
prerequisite-change-id: 20260327-dts-qcom-eliza-display-64de3cfc8a50:v3
prerequisite-patch-id: 827ce662558e6c9669425d70c563a44f0f89675a
prerequisite-patch-id: 9c102d9b419548ec7805fe87bfa0ec52272166a7
prerequisite-patch-id: 9190eb29bb9822ac57b9f3a2d6ca20200f8fc9ee
prerequisite-change-id: 20260512-eliza-interconnect-add-missing-sdcc1-slave-node-65020a3b2ecc:v2
prerequisite-patch-id: 2ba90a6d131ef9f0065aa7d4e855cc93d1e97fce
prerequisite-patch-id: 38ec6b086b5d9e602865adb1c0ab30d12304a5d4
prerequisite-change-id: 20260513-eliza-dts-fix-debug-uart-and-more-support-fabef3d24cdc:v2
prerequisite-patch-id: a5535fbaa3699a133dfd13cfa9a2a74b18b46dd0
prerequisite-patch-id: 1b4e40eb33adf28c8b6105f25f6636f82239a962
prerequisite-patch-id: 480c23fcf537d5ae69214f0aabfcef11418d37fb
prerequisite-patch-id: 827ce662558e6c9669425d70c563a44f0f89675a
prerequisite-patch-id: 9c102d9b419548ec7805fe87bfa0ec52272166a7
prerequisite-patch-id: 9190eb29bb9822ac57b9f3a2d6ca20200f8fc9ee
prerequisite-patch-id: 2ba90a6d131ef9f0065aa7d4e855cc93d1e97fce
prerequisite-patch-id: 7dd9c4f27c461e52a096ceca08427a724c8faa6d
prerequisite-patch-id: 91a4f29e0cf69b9cbaf243ac312b9b2f34596c78
prerequisite-patch-id: 4792ea10ca0ced5dc906080f571d54d6f4cac526

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

