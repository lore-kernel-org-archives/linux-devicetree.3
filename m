Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218843;
	b=XC2Bu/e4PdM7VTqJLwdgPHJUaYmK6fLydxgAeEjyjZzFwQVs4RwzcjEJciLdfnnqwv7J
	 muSOetdqaktJgwiCz1dL2ankdqxuLggejxxbEUt3l5gh3Js3lJSdEDf2SemfkfiFSp1QH
	 fRHsSlZ0QlyY7mfEuPuCkaZXRUSs9L0YiL/5zd6U8S7lFjcItNgwlQ+L6U7IOH0FcZC6I
	 NZD3rvBx2OMy408pJjcAyIO6QfKjZOSXFeZdJKrNMreVvwSKhzjyKLu3P7SZYib2+Lb2v
	 GHnkqrac+BietTlv92XQTcVk0EFrhiT4YU/CkF2A0KpUVM6ZUzcJpKx49dtNuAWm5fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218843;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CjV2MobfznHWSd6tt/gdIURuRgsbs0R2Ml80INwwLeU=;
	b=SWedTRQPhznq23ERY1EYdQUgvhto/uV0Z7CBtAnYsCH6oio4SyhJt7YOSTjCL1IHL5V0
	 A8YrVUSGOuFXjIokhSVRe90KR14+owEIo6c0ycJi0mTcjFSc219apmjchFJ89DPeeO6kv
	 edInNJtP15MtGkSQO+49Y0bSScEy5dsvmzlGgK4cEdGD+z1yfyyRHCdE57UzcRBJs4cuK
	 WfYrJWgqr+vglyYKiVhywDK/LhopSav9ImTWlN8hDF0DUPepRPmlf2D44GSq35vUvHR2X
	 qWeaIZ8RdzzN6oBcv703IklWF53pAdwA97kw2RjZvv0Ulq66scJicyIu86qf5xYX4Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="a9of3/qL";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SKYi8J97;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE0C606D822
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 10:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FE0C606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a9of3/qL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SKYi8J97
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99v5OY561914
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 10:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CjV2MobfznHWSd6tt/gdIURuRgsbs0R2Ml80INwwLeU=; b=a9of3/qL/4+MO8WB
	lGHMVmTU62rb7WextgOeaYfECVNulD+JxEQXiv2o+3WOcNDeConh4zHrNfl3wtP1
	dmEnFp9YlHwyAZ40/tqS8Zkb+FYvJ/SVdmXTQH4q15PvZ/t8MYHf45rhiN1JB//c
	AJ9xFAQaPE+q29gR6sjkoBSwTyvu9b7EtbGHTDxqvTdkviR5SJ4yMPYRV2ZuwxCG
	UveAyYACnh2FZJePJhAHvhUOVNOXqWIcYv0/DjUa+tfz0eAnQTqcESlF3giJ5pOa
	+Y4BucgJ2WmW0NgK+P9xS36u43OYJZqgjm6bdT6twduSjkB5yHQyQUOBuacZlZ20
	BbSGMA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxdvs7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 10:07:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb061cc4dbso467329a12.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 02:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218840; x=1794823640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjV2MobfznHWSd6tt/gdIURuRgsbs0R2Ml80INwwLeU=;
        b=SKYi8J97+2OgxoGsD780fr4IeIDgPlFJR5NTDW14l5Ay7saa+/U1gpCuwdE3WoTP65
         zebf1Qm2kEmsALB8q/mtta3rEcyUwf976yYbgp7E+WspdEuy98bAAM1bVxVjewUuT2Eq
         JNrtsc3zGPilX/U38DdnefAvvTMC9IqnbjRcalyV9msmUNf+XaHtdFItGUcibhnPtCLC
         DKGPLxPKkSJiEw1o7OeReEsMTL9WlwTTp+RescUmHVEGj5u+JO4LaD7rQohsXey4tIRM
         WTaNFTTkVbu5Rw+v8HFO8x3s59b0Vz3vmy7S8q8NjeMJIVb5DY875RvZQoUtgwr+O42F
         2MOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218840; x=1794823640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjV2MobfznHWSd6tt/gdIURuRgsbs0R2Ml80INwwLeU=;
        b=m+8PnxJU0HONu1GqWg31yOcfCDWsQd/A5dFCKihXL+BzipgeaRz3+cBfnkTgXTgKiD
         Ac4l/6+oHVtqKgsQkB0w9nx/X1Fy8q08Ug0t4skCE7LLDwzLobMgLwMQJJMFfH8whc0h
         ZR/LCbt75JGUSm9Qwc/t+2ZSwuBhw+bQbJ8Q/0AN7BEYMfAAuIRDk1OvTo7/0SQhGzt6
         E1DHi1YDRz0H9kgO0BqamtUy+jFzUdvy+3GniHJ9qyhYHqDRifexGzQFIPBmreombJQe
         qwOAwkHNbU/xSavyl7viVNhcl6d40I08EEgmXD8/rwCF9gy+i+ZMpm7rAJgULUG5MiGJ
         DQ+g==
X-Forwarded-Encrypted: i=1; AL+hErE68a/o5StFhIiD4T2C9VPQ9mpULO0PwkXzVm3RftJVkPWHOgrXVaSkjtf6fkyHJYGTS1p5I0DhFVoU@vger.kernel.org
X-Gm-Message-State: APuU4Z/uJoMlsN4FxdMQ5bfzR+l5NaDgHvqqAGrn7LVqiKv0GSAlvHk/
	XSsp4+xyYJ1IgZmpZxy6Ipin2tJKYzA890rg9GcVcK+R2NH72QiZ8Sg90J+RSXhShE9FQ9gz8jR
	6vHovFQgcDSslUiOowVU3mwRC/UBPbWxYL+qpydLGlYEdYuuHp64O5FyG/YBueAZ0
X-Gm-Gg: AYBFou2uxAy6y+zA8KN9ubZ/XTSjzPxZiOfTIEjUu3gu22X3aqftMqeA5S7Rja+3hDe
	1/bKtRW/ZEwqEYt1qtjUJgBZV9GUHvdTYBfvTvAy0G7Fv9ezyKw413lliJSmAfzya2ReTfhuXgr
	X3u8YbR/wiTZ+BvysT0UG0zytuD6tAnPzj8hDI1ZcFevD+/w/OusZhO74Lm+B6X4e6knxogTBPA
	D5f0p/gDQpgcV0ikMEoOHBNxXcqt8Y1u/0Z0mUhuP4W0Bsj7TUYpHlFGgiV1m+vwQC2pjYqk6IK
	J97bTdzMYoCYSdFgnKa2YySFOqqbW/XFTkF0OaDM5AeQ61siARxyfFPtJv4Kb4637Mygdl5cvET
	3hkvNzkkemTCSZTASgad5DzUwocHXGQlndP9uBft25yrCCiXyW7kyJLCFml0gk7L5D2vHowaOvO
	WXT/eDQMByDnMktPldUpF7LDPDM2Vi
X-Received: by 2002:a17:90b:4c8a:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3b12d54fb2cmr2526907a91.32.1794218839554;
        Mon, 09 Nov 2026 02:07:19 -0800 (PST)
X-Received: by 2002:a17:90b:4c8a:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3b12d54fb2cmr2526877a91.32.1794218839087;
        Mon, 09 Nov 2026 02:07:19 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:07:18 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:33 +0800
Subject: [PATCH v5 1/7] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
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
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-1-150335a79381@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
In-Reply-To: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, Ping Li <leeonion.muyu@gmail.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218813; l=1221;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=dTfzizx2O8pIWKkNOZ5/tj+tagXJPodOMUlPeZeSs18=;
 b=WY70CK6+b3HD6F8igEKO8LA8i7n1vIrZlsEcst/OXcFuilQ4b/kjdatXb+vwpsWJnrgAaH+bu
 vPCzTswnJ9zAht0xJL7Sy2MaO2ckK12jMWNndpRwzyY4PojyLFaYyPH
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: UKSMWhwDkp5Lwly3vENdXc_W8T-XcboP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX3ru1wm3j+iwh
 NGnBXWrEgkuSqxU8TZJip44Msj5ZpI6qyb1H7QnDUqSwc9jp78InSlr8yutQTbhCPTyoBmRnZ8X
 rIUMmdXR5lg7q5QbohNbEqjgsAKF2RAdYiMxCS+BQiYog6RvUXYXYJZteuJG8D3+FkHbtOh2RYJ
 1dkm5OTXv+/d5/nIQwuG9mMS+IWMAyx8PMcErsTve4fcXg8WndZ5NwCl/mINcd7aLWQMMulHplu
 bOT4krqtXrk9lLZasrjJ0dJ+dNe2n3l7wE+Tey+du/HaYgSQbGSCUm5SWKuV1vAPgjlKx/ghCVV
 wF+655Yyyo9pKrQueAtornIVb1tUCWPp+MYvv6E1GsZiix0DkbU8aOrtWInEE0fuDTX+dpCgHT/
 //0cxZJIdbv2+tPZ4v6cIKtZzd4KX/JyrGeC72urULcvNMMB0oSgZH4e5SwHzId0uFfRnd62Nhy
 5G4TmIxqfpl4xDrgR9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX8QQmCKZn/00k
 ixHOujNLA7809XIonHAxOPaCgsn5GSr0gDHh5RE5F0wOZ+0tt1mfZY1jsjLbP6XEk0Rc/7JKNhe
 AAO8zHCzjlSZOGA4vsVcI34RwDl1DnE=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af19b59 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=cxiLKowE09Ysm4E8lmYA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: UKSMWhwDkp5Lwly3vENdXc_W8T-XcboP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040

The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
is defined as 16, so the check should use >= to reject index 16 and
above. The previous > check incorrectly accepted index 16 as valid.

Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures for firmware described ris")
Cc: stable@vger.kernel.org
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c067b6d57d71..05f785328dc2 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -700,7 +700,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 
 	lockdep_assert_held(&mpam_list_lock);
 
-	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
+	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
 		return -EINVAL;
 
 	if (test_and_set_bit(ris_idx, &msc->ris_idxs))

-- 
2.34.1

