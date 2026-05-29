Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61833E00A4
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063880; cv=none; b=YcQfxz+uuhhFVBp36m68G3lGqZwP1bKnhXzOyL+cRQ+5cZsXKeb2YDVhVjst6XY/xU7QPUftwdqxFnk4CNwFhUj/1MeWW56EgcKu9dowPdbTqksxFFdlRCOKF7DmbvAX1ZeWEsIeicZ1KpG5khkCHQtQ2T5pWuE5JeHO18ka86s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063880; c=relaxed/simple;
	bh=udBfKjlygn9xftyr0+PwOHEjL+q+Fomazsgn9DddlY8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YCJyRfRWJYrJV3chDHg2T+sfT/BlpHXz3DIfHKdYZI5uB8rkPS/E8WMlSOvZ89a0imiAsXU0CMkAhi28Kc3vQ92VBX0z4T2300IWg+ezHN1jJkan9OSpSqHfK+MB0gYNU0DEMYSKt9vMbmGqO7a5/RJq1Cyvhj07jSotZQxEBkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1cj1uBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cMC15rsn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1cj1uBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cMC15rsn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDLgPR2748127
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gLzSkiHHOFa32TGnLzHwSK
	oPGEUmVf4WzMNzq1f5vx8=; b=l1cj1uBf2okJh8Kidm4R5lwIOv/ibzJAVhZhiH
	Zp2NzVXjNFwas73pmWHfgbadxw5uq4gpFarbyZy3NaLxVbQQtrUveB3+dbnMOZDh
	B3qDq2igQaheksuHyYXygkZ8485HoKAnqyIegWT1yDM4//ulFb27Btg4E23eYycL
	KXAZdDaNd6y0qvhKTfSPrxKWFiMFyW4B5ZHIoyxgdzCsKFIU8mJgy4k5IPOR7E2y
	bcbMkWsso3JD81Nw0ayG/WQCj2in/GCF3FHr6Ob7RauwmWmNJak9jMgDSf6kARgc
	fVNDY19t43lfktoHnCib3tSbFQF/8fjDmT0n1S5xxu44cEtg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevug3wh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:11:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf004bf8beso27735255ad.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780063876; x=1780668676; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gLzSkiHHOFa32TGnLzHwSKoPGEUmVf4WzMNzq1f5vx8=;
        b=cMC15rsnpbDYQRTQcpnDg/tyCAopV/5btJXfi/Qg9Ixd3QXKTn+RnnYWduN5TArhuE
         8eOF/wBQMVzeGr5Sl1WrniQ3/+/uK9z6e6SBRzFdgXLk1+I0zAyeqGIZMg/3gDfmECmP
         knyUXnQjwvaqpDF6AVy50A8tw6BqOjy545nPnjTabkms2NsQCZ/IFtQ9zDQycJcyMKwi
         noowHWleGlydVxdr9X/Ux0TlX+yUQAVPHw3BZ3BKFjKXuXEl3aPC78N2XDyWSb39I1wJ
         95gOdH9um/9LwB++AaSXro1xsxno1PrHjTpvs66uiFLYfeu29Q5m5SZVlT5O20uB7IC+
         JHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063876; x=1780668676;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLzSkiHHOFa32TGnLzHwSKoPGEUmVf4WzMNzq1f5vx8=;
        b=sf6KJBbp8eYQur1lic+52LN7iyetwCnGwfunAQDYGuO+JBBFGFYjhusf8y5Bz1tfpx
         zBdWWHccJvI+1yInk+fjgFCjXofCADTyWx2HsilEtEBUjejCGbrJ4j3kfWC/3qOnzutl
         n3H7GnO+2BmzGa2a+k+UU6QIKgdwmdklnA6zEWf35X7m4TK0r8XECwxRU4FqPqV7PUbs
         WfN1f6Y18oQF12TIWNYzoYpPlYWQ9VN66gydbq64vxqAsxqHYCNqjrhg+cSsS6xJwFG4
         zMD86jNHClPIKNGn4Md+TPiqLsK3UA2voAxw/AYFIElg7D3sqMwSknbYSDBieGS9Tp1E
         5jAg==
X-Forwarded-Encrypted: i=1; AFNElJ9dQAQMKCM38QFbdmtOQwMIWdPEQn64KkUJVNbyxgvl/EiBMejFLhA+CfJKPXCELz5g0q/bS+cvgzRI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Zn/XJOwDuNmogDkz/59h/gRy2QazommxAI2RAKj9SPsPsMA5
	Cqjz+21M35zj8BJ2Hflu0wbT7r29YVUiXq84NcUvxfprQYLFYXTF0wUgDy2J+mFl+K9uHpyVB+h
	F2r1lkh1GGd5MCPxLR3Xj/DEk44K8XHgwYEt9D7u4rbp56ohDbIN/9I4sqOLsMJL2
X-Gm-Gg: Acq92OEGvtQb3UXBLl+t3MFG2CJiizUKlHdljan2tDsbY0EKgX4WRraKC6uvW4q1tiT
	1h/tqcsBSPG861XJYeqXWkmaXeYOzVWkExg0fxwHv1IlIDky/0BKRNTWRVmky/YtjpX36FAw6UY
	/AuXHNMdgbbJTVvfvAuIpAbHbxYDJKxJr366bfmz/f1+7U6Ydn2b9F4dpZVPB32xw6ROqhHlnkq
	e2xxy7dDfLJ3AngWw5R8JqSsUj2A+4ltBYTDBoLSsoXiwh/uge4iC24XURaWSc47U1yuuqHNZ8z
	JNuqZ/lc3m4QvOvK9jRQO79uvxXnLc/J8UO8ZzDdrRq0r6TMS6lGGu1N+Kb8B4donRBb8fpW67Q
	A4pntPShfUKkrE50ZjDNOyYhb0g+SAxDmHFgUi1HyLap1axfwEnCsaWTM//vEasQvRJrm
X-Received: by 2002:a17:902:ebcd:b0:2be:1b3e:3a1f with SMTP id d9443c01a7336-2bf36779d38mr194755ad.2.1780063876223;
        Fri, 29 May 2026 07:11:16 -0700 (PDT)
X-Received: by 2002:a17:902:ebcd:b0:2be:1b3e:3a1f with SMTP id d9443c01a7336-2bf36779d38mr194055ad.2.1780063875520;
        Fri, 29 May 2026 07:11:15 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a00a53sm30775215ad.27.2026.05.29.07.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:11:15 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: [PATCH 0/2] Add psci_sys_reset2 reboot modes for Qualcomm boards
Date: Fri, 29 May 2026 19:41:09 +0530
Message-Id: <20260529-psci_sys_reset-dt-changes-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH2eGWoC/yWN0QqDMAwAf0XyvEBXUHS/MoaEmmpwaElEFPHfL
 fp4cNwdYKzCBp/iAOVVTOYpw/tVQBho6hmlywze+cqVvsFkQVrbrVU2XrBb8PEM46yYaKQ/Ibk
 mBseeaqohp5JylO3efH/neQFXf83JdgAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0MSBTYWx0ZWRfXxQ1Zi1brL0k1
 c283HvRXIrNmOBiewjIsOKs/k05oZ3yMC1IoBsA+dNax1yF1ee+pK3x31w3ZkHR7cdXATtnKC+7
 asryVNhl8UCIj+H2V1lrDnj0zuBY1pIEIcHMZy9ZQrf6kO/feKLpoQVPbNuGS0ce4FheMj7aAUx
 mU3vlG/eN3P9NBdN1mE0k679Pkz2t9Lvi0LtjAdyj9eEbkyx18di7KVdFUFoDklhs6MDUkH5t8w
 pvk8O7kiEMb1B8AWyWCnFCrFVmspjw4dXg97/1HF7Hr3jz5AYC9HB2YkqHty1klvQcGkxClp3z4
 un6HjNpwereYX++RKx/Cc/1hV3mUnikK8z3GOeA//5ymhVGBC6hu0bO9FjRfWBi/Mt4bGBHpXq4
 79qhAJn2W5qT/lNP8oP2VD5DjdMezS7o0YIUaOwz3Kgel0mEMBsiA5NeqX4QQ84WNkSxGVRKPjd
 YYrqXbceKsfxh7OS0ZA==
X-Authority-Analysis: v=2.4 cv=SNBykuvH c=1 sm=1 tr=0 ts=6a199e84 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=duSgcVyVFfa5pOUly18A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: UyI60BmMpVt61aTO9y8-zRUDbVY-P53x
X-Proofpoint-GUID: UyI60BmMpVt61aTO9y8-zRUDbVY-P53x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290141

Adding PSCI SYSTEM_RESET2 reboot-modes for sm8750 and 
kaanapali based boards.

These DT patches depend on PSCI SYSTEM_RESET2 support introduced in: 
https://lore.kernel.org/all/20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com/

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
Anurag Pateriya (1):
      PENDING: arm64: dts: qcom: sm8750: add reboot-mode support

Xin Liu (1):
      PENDING: arm64: dts: qcom: kaanapali: add reboot-mode support

 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 2 +-
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts    | 7 +++++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts    | 7 +++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi       | 2 +-
 6 files changed, 30 insertions(+), 2 deletions(-)
---
base-commit: 6ee02bbf328be8a8586487e3af73b65a906cce58
change-id: 20260529-psci_sys_reset-dt-changes-for-pakala-a09fc0e2a8a8

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

