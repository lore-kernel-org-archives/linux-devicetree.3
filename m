Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE7033D6F0
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 09:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787651909; cv=none; b=mL6eZ0HbLXhe8TdmOy1mtc6nQj1TzTyTMflCjKa4NxtJG3K8yOq0agDLs9EDQKqzRuzNGWocJw5hVN6wqIMuxJ+NWLDR96ggrI6/jNwqaY1IEmPR+sNEvmjQzCZndlWMMXl/WoCRnKjcBJuhw5fwPsu46QFkjJnnLsKXuyreQUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787651909; c=relaxed/simple;
	bh=wvLhuh6D3zuqvJBN+pbjlmS19iG9iawqz4eSwrGU2Kk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=f5VXPJwarqHbuqbAPSPWakF7W6ptPtDrqJQx3lEL9nuAFd73xMK7DujGiqStwxpxdFpQ6uFmwmDB0R5lWCyecuhuJJ9667F96jDqmp0EhHCFT/FHmuemjS3YL3u5GRExfxpIZyAwftSfduHMveodqOVevht1D5xTJw6rNnLPNnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/F0QqfP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gUqLjD3p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/F0QqfP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gUqLjD3p"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88et31253719
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 09:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PEYAhQ3J8aUvei7jkz9TSX
	OAPoN/13pBNHNsOnjPUjc=; b=n/F0QqfPV4ukKPBRM05MIk7c06Z1na4KMQGzs1
	W6hM3DbMj8OCaK5ePFkxxhdDRkIhO5lCdkjGTAbsLYRnJb1pOxii9UUDzzaiK6B4
	c0VJFsIQV6KOnVcsxEiDn3/T4YOUNvODrsRMQgoWXzqZwBpL59/MP0mUcFSFrvmR
	g2zZ84gCJ6DceX6YFgElASKGScAOlcVwjb5guR02mMcTJdTvqBw8X71obJgOob/+
	zOL3QBisUUfGSqaavhoP/zzqu6T7jY7IK6YGiqEjbmiNM9cTTjgi+D55kqspOce8
	4Qfsw9Iz3ZoQdCd013JqnNWJgzRJvTSy2ZcMbo8wn9jznNtQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t1s3a75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 09:58:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d28f8737eso84591651cf.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 02:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787651906; x=1788256706; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PEYAhQ3J8aUvei7jkz9TSXOAPoN/13pBNHNsOnjPUjc=;
        b=gUqLjD3pQZoow4EuDGjopZ0+BcFP4SKez/xBvzskqCTgZ9XkrzrZSjw2F5G2VqFKbe
         DYZaaKCoB/bOwQh/J5gnfymcydpEbAYiSrGCcfJ903ZS2yootr9G6sS/WLrC0xc4cAcD
         MYAEq019k2DUquyeLlZa8pxWjrC/xLsPStOmYYQKF4ux7aMTYIBMLF4TZFbTnysTLq6p
         OInrbJvLGOALrRtS6pS+hV1Mrm3LVk7YDO9vkQbK76U+agF1xujma3fgSZsZ3hc5J9w0
         VG1B9jd9y03D/YR0wegGhcWU/2FhDT9RfK0w7ILjcwqjuQvcB/CwCc4paNc8K2vaKgtF
         k5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787651906; x=1788256706;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PEYAhQ3J8aUvei7jkz9TSXOAPoN/13pBNHNsOnjPUjc=;
        b=lx1YwdPAuTh6Ej8T9InkMZ+1oN0UpWUEyvDJi1lpDHOcuaSFIg8FIWEeJtlM7xokDy
         HgDwmX7HDS/Xd32zLHjpczc94mn88cEv5o6IOvXfA6h23lXMr1+wzrDJGIpRaS0e3Z7S
         TA55li923Olpl57jimoFDRwTKXNgeE9OGgmjdGkEFbQ0YWDKTXPztDxUnQP6s3aieCmT
         0p/AjQ1R/Yyd+5pyPYRo359CjyHMX41aypfovG0IfmNLqk/NaQxq75dBAyZ6wlPDmEVi
         XRnJrSRH9LvCDBUV7p0rsguEIBTegjUvHdFaXlVxvyC3qM5JF52kjm6YeOPOV5Zwg6+J
         QFbA==
X-Forwarded-Encrypted: i=1; AHgh+RocdoMG0z4ksYhAgHnAm5reFaOPamVjDavoj1NamfI9Uy2hp8Jllu7M1RgWisfwNAN1PK/AkzrYdeL3@vger.kernel.org
X-Gm-Message-State: AFuF++kHBK1LzQarrMwywV5NW/BON1QDrQgmwbIOKpHKKcgf9RIafJ0C
	Dk49T6quOyenCpcYWUD0vfMS16YLGsXpb99iL/Hms+Uz5e2FlJmI18LpaDDXFUfnHy/wfnPEuhf
	BEoF8mW0ZP2xu9oOoGGnRfvjUPb/zGXCJwSkn7u8evk4GgDLyxeP/urx69xFhpNrf
X-Gm-Gg: AR+sD11bG1tIr/tzjw6Sgbhs6ZaGihxnVtcxPKw5AcNLQEKiacecbBpaXTDmzhgJGm5
	Qe0e4PG8IoSn5kMIUxpLl44g4i+EPJFRgvgk+BDE6jhvUbtY6siwC1zyH+WeXVfNGUqQlUk426s
	gAws21nAxPBrtqG6K4bNG1z6DYqf5L3UoGoXL13qDMMOsKG+V/sbchdAIOkjzZf43cctMhRKG1n
	6BRLLQdlhwAp207CzmYAT6QskXGkJbLLXSTCa1irFi8v7znzUaCaMKMa5TrmQdS+z/Y/1fT43lN
	dxmk+HJS63p2tKco5Ux86WR9aEUNYdZ5ZvV/9Qakh88MB9+fbayqV5LftWgWLaGQUvgo1AJZkjQ
	YirB/CU0=
X-Received: by 2002:a05:622a:1822:b0:527:809c:f9cf with SMTP id d75a77b69052e-52e09ca6647mr259418801cf.21.1787651905869;
        Tue, 25 Aug 2026 02:58:25 -0700 (PDT)
X-Received: by 2002:a05:622a:1822:b0:527:809c:f9cf with SMTP id d75a77b69052e-52e09ca6647mr259418501cf.21.1787651905279;
        Tue, 25 Aug 2026 02:58:25 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f58dfsm1647264966b.38.2026.08.25.02.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:58:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 12:58:18 +0300
Subject: [PATCH] arm64: dts: qcom: eliza: Connect USB3 PHY pipe clock to
 GCC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-v1-1-f0d3719f798c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADlnjWoC/yXNyw6CMBBG4Vchs/ZPsEYUX8W4KO1YRrl2ilEJ7
 y7q8tucM5NyFFY6ZTNFfohK363YbjJyte0CQ/xqMrkp8qPZwyfF6PoW3MjbwnqPVlSlC5i0gh8
 w1C+45o7UIziHssiNPZS+2pUFrdkh8lWev+X58rdO1Y1d+n5oWT7IJ4r6lAAAAA==
X-Change-ID: 20260825-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-9602a79db396
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1209;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wvLhuh6D3zuqvJBN+pbjlmS19iG9iawqz4eSwrGU2Kk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjWc+T3YLVy7r9vD6sgYajy2ci6yOv/K3hKxQv
 q9KsL51BG6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCao1nPgAKCRAbX0TJAJUV
 Vs2HEACaK+A4I/83EiwRV0P57i/GwKly7m0xAIG5Aw1VVhL+EwHrPZM/TCbE306JXsCv4vmaVm1
 q1SRgnQMmhvO9GcrfUAgng3FmM2q5kiORL8RAEsw9TF5g10kXH0in8uPFP+Lk48TuIZr3MsAaYC
 0ZZJ5126EpYoDfPEVWzhr74NYnekZnl5tnKack9YQ+Xs0Frwlu2N6GXym4pD8qklqeV0FF/UDSx
 NN5j1FlXvd91+IZC46ojiQ6k5HiXtlHnWQe70U4C7qazWLNrHaAlGLDHCn9/BQXajKroGEq6aH8
 On+TP4Cu8moIBsCPaSvrQuy8bOP/OO5Y9A0gpczQMenF+9nd/U29mdnScdKdtPi67q23eayqmmh
 mUXxf3HXofWmWoycscOr2f+QENNXTbJDjpZ9ms6saS8x8qPNS7y17EWxnzm2OvuNvvqcw7ZrnU1
 Xn24+ir6qoCOgX98dctvoqFxLeMwctC94JAMyxfTvKd4DxcU7ZExeUzhTe0knxpNlZoDK8zL41Z
 zMlhpeixhH5bauT/MgTEkiHCblCfO1CfSdL5nIL/jGunxZ1HnNwSvZOieDjYRpwZpZ/kQ9OTbly
 dnp3XSPKE4qRXhm73HKeFNS0hbx7CmnHX6bHtnamxePZcxoRmIVmmGrmgGiE7xuqSK6lZ/fL0eZ
 LLveVa3taOr5alg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: XPv3lj9e6RIZelpfknY0bUlooO37LI_6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4NCBTYWx0ZWRfX6wkc8t7F32Qv
 qoDmo9OQg3arKAnq7VyaVwJdUJwmE0ikCjQB9eo496GmZaRfORjqft7qQHHnip85eLlL3uKYbyT
 qP6W2s+mOJNENqjD6llourmoEn/6EaHZURaIpi3ejtcoyqV8hWfh45xoYZS9WLkuNww5YObnfC/
 07eBuzmZ3joYZIyRR9UJxIQn334WArz1+EOW/kCuV5L+XlDk1mONUvNpeW1g3Xnrm5T5iS8fY/k
 1nhzQmwX/czVKZYh4HUo9UqoT5eaq048Bx9Tta3R68st8juDeUUxt+g+MhVUH7zI2RCOR0n7UWr
 nFFT+7j17OnzP0Nz2vdR+7Er4g/p9nlMmm7/Tsc2kZKoiprzxeN/DEkfigNqyES39vyfJCI6RNk
 63Zv7iXRgTRq0cwvFbZXRIQN/hNqq1g3GMT/6VX7Kn4HrJTZ6176wZ2m3wLY0Tk+I3K+n2/142W
 ic10FegQog1OUBU+mCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4NCBTYWx0ZWRfX5ivYJz5uRl9f
 uALZJs+VF3G1uu3GAx4F8zSuUs9iynpfCka4CPN+Lq8Kquff93L4tV5oOVavji0YJXkXqRYVb7q
 oPiNgg9Y4QtI9m+0TkyAbpwh84e7rxA=
X-Authority-Analysis: v=2.4 cv=L7ItheT8 c=1 sm=1 tr=0 ts=6a8d6742 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FqyXsmgzfy39onaLLngA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: XPv3lj9e6RIZelpfknY0bUlooO37LI_6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250084

The GCC USB3 primary PHY pipe clock is sourced by the USB3 pipe output of
the USB/DP QMP PHY. The corresponding GCC clock input was left as an
empty clock specifier when the USB nodes were added.

Connect the QMP PHY USB3 output to GCC so the USB3 PHY pipe clock can
propagate to the USB controller.

Fixes: 88ddafb01ec0 ("arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 66ea4aaafd73..2e0fbbfcc47d 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -655,7 +655,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 0>,
 				 <&ufs_mem_phy 1>,
 				 <&ufs_mem_phy 2>,
-				 <0>;
+				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
 
 			power-domains = <&rpmhpd RPMHPD_CX>;
 

---
base-commit: 4b18edbd8e70f7e6860d56370f13244896d0f95c
change-id: 20260825-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-9602a79db396

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

