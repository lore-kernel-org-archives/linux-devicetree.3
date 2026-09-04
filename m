Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA63148B38A
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 12:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524515; cv=none; b=dV56WPtPX2wqs7UzuxMzo/Jb6W4XKvX/4OhayYVNdqAulInje0/XooIka8RP9ajP7BrSJ7emHK58nFnHinPcK5RhqoFS793SS27Tas4Q5G7W73K/VVYN+S1E4ggbq/BD5/Mwn/dFM+BDTS4C/qWq17QnacJOymwiIQ/sV9fS1i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524515; c=relaxed/simple;
	bh=v6SdaWSgxymVKHJwk3EmFa5qVb23IUXi1ji4aQ+Zsbw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VuhJ4rN+m+qGp1ltFa/EYYJykNGk3RoT0gKkpDEDbd7Nsk5/SyggLesrEwG4zopO25sQMMEeeSvCYE/MoAV/Er42IshUj3n4K6vBEDC475DNp/1XITwMdY+Nv9gfUccB39v0lGAcx45/KX11xX8PTsPs2cQfBkQ3VEBFcwB7Z7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EIn19SdB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UvrRIvR+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EIn19SdB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UvrRIvR+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AIdMr2678736
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 12:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JPyvPsBHx45dZepUwhtUfd
	g2ue7cSA7It7dpIU9ph98=; b=EIn19SdBTm7SNKD7CHg5hP+07uC8EaLlFwSp+X
	w4DkCLplteF7KDj9xGmXfsIOrSamTy53ith750zGEYrWHTLqwlHOMu3HvW061J9t
	GYuvE4MzbMRJorZaBKu9TLwzVcmmouIX1gNInGDgcSuO+K0rRD5eFmNVpEYYi8U6
	mVc+0/p4PNJwfPN+x4VjBfMVccoZzMN1aKwjsrpeKaWyyX7jPuNR0AaxtQIVCMtg
	KhAjeZaA2QNjy1+JAKJ6a+CrMaBCkL2kG0wLmJ+2v2X2cAy/PPtS+c+guSx/BVzD
	GXPWROR6Yz8Q6tuxznHe7HoHaLjNkj9xPrzaC5iE303YWCeQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fhkq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 12:21:52 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97c83bdfa6fso696466241.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 05:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788524512; x=1789129312; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JPyvPsBHx45dZepUwhtUfdg2ue7cSA7It7dpIU9ph98=;
        b=UvrRIvR+O5S8c9T8iXkfSe6l9oK79kIjzxi0j+EZAKNWA3Hp1/rpdehRuEqLLZJrGs
         xRU55R9QS2AaV4Q1sGU3yp05QfSD/VAGOZrZ/OCrmgmS4kwyxymW/ieIA+ppmznQiyyU
         7ptqFm3o5zxkv7OxQLjKmiNmq9bQ+TbWg/xcknxBRv/wCwQG8hX9eCL6Ktgu30K2rWCY
         pfcxNv8T3PyRS2xR073+80igDpPHV1Q6vPybvDAOKMiepZX8ojLyn2epFiWh4h8/TfaT
         dNUeIue+mBxsgZsLO71mIcClEN0Dh1HN80s5jLyChLcz8Zeo8xqP6WINwx/ojPJfnrYj
         iiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524512; x=1789129312;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JPyvPsBHx45dZepUwhtUfdg2ue7cSA7It7dpIU9ph98=;
        b=d7wMLCFizHU7R5ACkGVg72WAZ7brutBgCYp3+kQ2EyoCH3pYjc2QdaCU7xRkMNUNz1
         qbaTJ81iN4U6V4guZoO/f/DWoHDYw4hP3cvVbnNOueb4v1NSVbKjm/T7zE4xhprlkE2p
         LIbLGz//c5iX1AGuk1OB+AK97u76yeZdHiZWSTdOPc3b+y1QFwar6dngHOq8KM6cwdCP
         cI1rXpYo8iL7lH6I01oALABEW+aQWK3dThP92NxBvu9VYzvyla+vhEpf7/Vt8iKgReSo
         1NUf/7kmy+MBGSqIMNovshBc/CPlMrmttCzwr7LNPaSEv7Uh65JE6bf7qx6QzrDp5OKz
         ss2Q==
X-Forwarded-Encrypted: i=1; AKwUvBw14fVWPzTjr30Rsizg3ZjFZbluHWqCwcJqJhNjZh4e2H9ltojdCMG545scYbTt18BHDXm+ttl62Kii@vger.kernel.org
X-Gm-Message-State: AFuF++nwZ2wcNcwx4qp16M3grlASJyC4xvMR4eTWudCbcZv25d6ULQEX
	zzapZToKtfAkH7ZuGUZO2uuq6gjpSH9fVfNtiYcHHj1Za0LeB1z8WLN5PYpRWv5a7wUT6luqHNu
	P7asbPzP7NQ/HAltro9hXKWMKUyXP4rHJUrlmXSr5i7aP5f0RTZaGpQQvqXneDeC4
X-Gm-Gg: AYBFou1HB5icDyfdh4EMJb2iSADszzDMckP/eX5B/eG7bMRsrEH3t4fKisvbniCAlqk
	RyVpfs+7eeCWjuHpb5cl0egjWhqXzsv3mDwdG9WZkOGuTn3WiPBTniQXxRt4ZhUoAfYG7ieocl5
	F2R+3b0AudghrZrrfzGfggWb+z+lOuOQdaiZiLLGkChph5Nx7HOjZ5lqH6w2hx0mZqfFgeULxPN
	lRLqbBbckSpK4AZzGlVJd2lchZWMq+zzfB/J0b2+32FjbticGYXsrHHwP7X155wcWr95WTxLz7A
	Ce5ry+3ltV1Gz1EpTHEcqRxNangQp1KenrNS+Vk3apVCTho+IdvsAlh1DrDmFKgp62xbsrdk3oj
	OHrbCjA==
X-Received: by 2002:a05:6102:291e:b0:77a:7620:81b4 with SMTP id ada2fe7eead31-78a4a839bd7mr1800472137.4.1788524509184;
        Fri, 04 Sep 2026 05:21:49 -0700 (PDT)
X-Received: by 2002:a05:6102:291e:b0:77a:7620:81b4 with SMTP id ada2fe7eead31-78a4a839bd7mr1800448137.4.1788524508640;
        Fri, 04 Sep 2026 05:21:48 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm195686665e9.1.2026.09.04.05.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:21:47 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v6 0/3] arm64: dts: qcom: eliza: Add CDSP support and
 enable it on MTP and CQS SoM
Date: Fri, 04 Sep 2026 15:21:39 +0300
Message-Id: <20260904-dts-qcom-eliza-add-cdsp-v6-0-d4f38936902e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANO3mmoC/43RwW7DIAwG4FeJOJcKbAiw095j2oGAszK1TRvSa
 FuVdx/pDou0pdsFydLPZ8u+skx9osweqivraUw5dcdS1JuKhZ0/vhBPsdQMBNTCSMXjkPk5dAd
 O+/ThuY+Rh5hPXIC1bTQu2ACs/D711Ka3m/z0/FXnS/NKYZi5ObFLeej691vrUc65v7uMkguuQ
 ZPRxgM24rHLeXu++H0JH7blYXOzERYcyHUOCkeSNDRtg0HCCodLDtc5LJxDkoZqa9Cqn9ym+if
 TaNQghHM1xZWp1PdUVtzZmSpc67VDZ5GUrVc4veDwzs504WL01rcQwcFvJ5im6RM9k1aVWgIAA
 A==
X-Change-ID: 20260714-dts-qcom-eliza-add-cdsp-0288fd79c8c2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1924;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=v6SdaWSgxymVKHJwk3EmFa5qVb23IUXi1ji4aQ+Zsbw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqmrfWpO851SkbKqdcOiPD1Yhu3pxrzJZzJWlui
 FSgVm8WNHCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapq31gAKCRAbX0TJAJUV
 Vhw6D/4t2zxJJNWWVjzNqv5MFfj69K4VEqmcTXKZ+8ZNsfBqt5ToxH5XDMrmBlkLShHHNf1sCZZ
 XGz1G8L6iJHOjA4z1YUhalUipRS+gici+wYjdpdx+FFojPGK21561UKe9yOGC9GQJbrE90dQgFD
 s2sn1QQ5jAtFpo/KWDKUz2v7AGR9W9bAQMFGDeqvgAAYE/yxk2F0DYVEQHjxImSLJkqww96QR1b
 FhnQY4drM7lusO7f/l46MnMIHVhrpDCx5aH6tu4vXGZaPeRPF3U9H+h7UzBIKT5Sly1BdYt8/6q
 q3bArs3xkbReOvezc89hL37gbl/CEe8W0Coqpk7HZYpJ+JKiqtxIhilf+djMGhwm7PqXC6Q1YjZ
 s4GKFJUd3U7Zb5+BfEzNyRP6yBemXoGuWxFtUCZNPKHwKVLDkAqKIcajGgNQeTNn/lLojjXHg6p
 3IGVS8GdhDs8VZm+samdkwblLGR4/jPKZhHhazzMqUbVrE9lKNd+mY+7B2Ij1IaL7wWDX6NwvcG
 A5iwMjdLcYKNDtqVjBW0ejdbYrlaI9xs7FEMdrIHlWoNciNZl5xXGrrxzURnUKz+Pde5bXhpGgh
 cEbox7TzQnIcrXWYnu4zuaVip61/AHRXgYPHdubI633YrkEfe1EAw41u0E8drIsIfCfXI/ZVKx7
 rhC9lmJCbawRTqQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9ab7e0 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=LR_dMP8fg7ejCj7yXwoA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: vlv9SA0Szd-D54n6bkb3e2PpYAU2Tefa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExMSBTYWx0ZWRfX28mkGht1EVWv
 2HN3LtKjxENXc5qIkUqy/+E1x40H/B0MXaBTvDErnLHEidLB/Iaa1JKE3q5KFtHjf5KT5HvOovl
 4gHXMhU0lEB1k2DsHqfkmNKG/L5G/6g=
X-Proofpoint-GUID: vlv9SA0Szd-D54n6bkb3e2PpYAU2Tefa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExMSBTYWx0ZWRfX2TdB6w95DRsb
 wFTjBc/ll/s5fe8cZAJPI4yb9SIY+xsg6hRiOjFWxWmTOmxWeddayODYQ77pe+coZv75wA0ony9
 4oqyE6D8i8e4QOAni2/kIFSB+bL676wjjhKb8OMAXJJLUwLK7ejE7FIQJ6IbCBuPVe/1WZcUty7
 3DrHINOLlci3h7C1DF2+vilrE8XQdcirP2INTPBORZ++SB8JGns5gClxrzfXZSoOjCG9Awg+P2v
 rkflivdg9yMMVJB/mysQ0gU7EgXAAzrql1pz7xPZ0zzItaEl1uhP8cY/HCC5HWRH7MUXnG+2GT8
 ipFSS6w+bxLQ/D+EjlX1tU6yYl09O01Ong+DgfYM+CtiM+MWTE1A4YbyPzOhhyFZ2iINQ/qyeoS
 pHWvm+jQxVnEK5crl3pBwD+gJQK1zAl5opQ/xYt0rGwsWpNGaqofid/hw+z+hPYClL6YLapXHnq
 and+sicA9zB8k+GFQ6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040111

Describe the CDSP node, the glink-edge and the related SMP2P, then enable
the CDSP on both the MTP and CQS SoM.

FastRPC node will be sent later on, along with the ADSP related one.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Changes in v6:
- Rebased on next-20260903.
- Fixed conflicts due to GPU patchset being already merged.
- Link to v5: https://patch.msgid.link/20260831-dts-qcom-eliza-add-cdsp-v5-0-dda8af2d2920@oss.qualcomm.com

Changes in v5:
- Rebased on next-20260831.
- Link to v4: https://patch.msgid.link/20260804-dts-qcom-eliza-add-cdsp-v4-0-fa593983e486@oss.qualcomm.com

Changes in v4:
- Rebased on next-20260803.
- Link to v3: https://patch.msgid.link/20260723-dts-qcom-eliza-add-cdsp-v3-0-b535200996ed@oss.qualcomm.com

Changes in v3:
- Rebased on next-20260722.
- Picked up Dmitry's R-b tags for MTP and CQS SoM patches.
- Reworded DTSI commit message to suggest that FastRPC will be
  sent separately, as suggested by Dmitry.
- Added the GLINK edge node.
- Link to v2: https://patch.msgid.link/20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260720
- Picked up Konrad's R-b tags.
- Link to v1: https://patch.msgid.link/20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com

---
Abel Vesa (3):
      arm64: dts: qcom: eliza: Describe the CDSP remoteproc
      arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
      arm64: dts: qcom: eliza-cqs-som: Enable CDSP remoteproc

 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi |  7 +++
 arch/arm64/boot/dts/qcom/eliza-mtp.dts      |  7 +++
 arch/arm64/boot/dts/qcom/eliza.dtsi         | 75 +++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)
---
base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
change-id: 20260714-dts-qcom-eliza-add-cdsp-0288fd79c8c2

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

