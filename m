Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD90638E5E9
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 06:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790404471; cv=none; b=rFSzBO1JrDOqzn0qSbbKFRkqtexpXSXdNRTOuVRUorQopD3JPm7Qmnj1GVvh5/hw+9V3RGnJGASUFdAJ1i0Z9dotqskQaw1B0TkxyVUB+LeVAiaN9GZttVrRASyNaZAWYDPqfiBC8RK4aGBu+Kl2kHXOLRz7t+gJa7KsqDmU/ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790404471; c=relaxed/simple;
	bh=Xdm/YCC4BeINIfT2Zgsi2yeNaax81oOmJezGAPhzjOE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TTUhW47hiKdCysN0E8pWqNEFOpC/ykGNw+P6X5Pq9fllZbVuz7tKFxSb1an8nVmZv/aXzHG4m25DGkaziHTRgjBEBb+24fnB4XbZR1yJLxr5+jP2HQ2kBxc5U0Hj8z0HD6bZbMZHDQYlbvIK2BMzeCcBUY51s7Dw3WmkIWUkVS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmcp13d9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SsSZCdca; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmcp13d9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SsSZCdca"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6OWGa3267507
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 06:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yrgottYUGCcsJA7UDEha/9
	CjjUOSrK4LSL3uuS0YubM=; b=fmcp13d9m5utBrTBwNtoGtUTJXmVD2JBipMnXr
	aR55oqAf5FBl2rmlcIIUKzuFHHe/iKK28+cdxLwmE48c2F1Uqdu8sLZCGXH8K+JB
	V2wWS9kmr1/JU72WOQFdGOHHkP5EQCllSJUmJjt/juPmOiZjZAhL6R/hoJgnoWMB
	9BOrZMbOTx4V5oDEbYeucKxy76Pgi+P82m636iAn7TEnq4CsGpck42r4k5iVltiY
	Q517liYHJ9NUfP8kFuiJZsLRrCeZQ+DQyXAMQ1mPlq8+m5B4mYFWiJgayhxuxMJ9
	uhm1pIDWO25gwSoWHUtMkjV8Bh0Mrtfce7HNL6OcTGY00Nsg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3dp0nad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 06:34:28 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1416f32fe11so1225528c88.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 23:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790404468; x=1791009268; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yrgottYUGCcsJA7UDEha/9CjjUOSrK4LSL3uuS0YubM=;
        b=SsSZCdcaFyphsYK7kImrO453gjnzamndbBoJY5LbBoE6DeY4oTIzQfdfVHqRYlcX0a
         naI8g7TXDEPFSXWzLAD3asi81WVsgA8A98HtvS7iLVxpGqjiMLCgTYbmfnPS9nh14Ttd
         7N/vTfNppz7K/JHqOt7qp6YqhozfGBn9rR/2SljiQQVzBXG3qrf2agJxelaGOto1N+2l
         er+Dil9ZnMkUrsAwVLBJ6Lx9IPHYKtmWzxAHvHuEivaOlU8dxSycMhrfVAfaAJgnaOQo
         aqVdxg0MiMGSb9IY1tiOCjwO0U4CyxgF5DPWctaYf8nxEJNb4Cqc78cX8KGA0QxgnjYs
         KY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790404468; x=1791009268;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yrgottYUGCcsJA7UDEha/9CjjUOSrK4LSL3uuS0YubM=;
        b=hXkNktG7ChHo5SnEtqlgP+An8zb5rTabIkuG/OPtvf9nP3qo7burvtDwH4PqqeR7nr
         SWgs7gYlYWG6NC+ubOi1CmuQr+frA/PmVU4Gv2VHSD8g/dmdRXJwYRKaIq4K9gX6MZym
         4FTCGWJBqP3INBjodISOwLFbetuU8APgBOMbygfe71j2sNy2DD1+kO4i1EWFVgMdjMPc
         MrOnNrLeni2aNN1zc+LxtN1SPqqhvKPEtnHytwRco8JKg0ZpQGto20PLbIrglcJh9Ach
         biK8/bG76lL723EEwUyPQR1rnJ7OK1oVPmnU9WGEtHrmEajN0+XV6W4B6oKYS9joH/jo
         lF0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzUHXFpVjmGkTfurNvO85binfMeAc9GGSnAprwwA1ZAMAd5w9QESduckzHvTJEDJ02ATbvCnz95FpHb@vger.kernel.org
X-Gm-Message-State: AFuF++mT1hjXsqAAhNIvl7YIGRZ2tXucrYbklDS6LyNjl1QelljDoyrx
	OnxrOsBUbIvNmwTgBs9ROgLwfYqTu62UqzXXUqufwVSdgjvFNNNMHdD4onWNvL51Bbn1K7H4kz7
	fyNN+gLpmA/3zg8PD3RiGd9OzGivcgTv0dJBMZqEdTL2hgfqK3aOK26fve96jzrWU
X-Gm-Gg: AYBFou0ZM2xCs3YQ4LFVSOMKcEJECFK3VQ9NVFqPS+NfMdiddTaX4WvOL9+pR4XQi8j
	BvypBENnr5yoFyyyawBvYvRIzicmCix1dSW4mCiDnDqGBTtBkDvrwD+0RNkDjKm6qn4pVPwRr0R
	BTuctVBeQ3T9zY2FK4jABZGHWbs9J/VhRfzZl+mKh3vryXuvw/8SXRDIXLOMK5ruyffU39G3Zmi
	xA0OnvXjRT3829n20+bHcUEdBzxjp18iQTi1KmXTdfa6dhuMxOPAwlgC7ewTCtHnqeKHBMZkH9B
	E+0uRwviHdAETVvgDRLaEDOhJstXn9Ij+hr2AEqRtKwN3RLSp99n3IvlZQhsTCjQpmLvujciJMx
	Iz5UJ2e06SFhe4LRa0ViTH7jbVaxGTZQqEg==
X-Received: by 2002:a05:701b:4254:20b0:143:4d12:396d with SMTP id a92af1059eb24-146cfec876fmr2188927c88.26.1790404466551;
        Fri, 25 Sep 2026 23:34:26 -0700 (PDT)
X-Received: by 2002:a05:701b:4254:20b0:143:4d12:396d with SMTP id a92af1059eb24-146cfec876fmr2188900c88.26.1790404465834;
        Fri, 25 Sep 2026 23:34:25 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm9700691c88.7.2026.09.25.23.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 23:34:25 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [PATCH v5 00/13] media: iris: Migrate iommus to iris sub nodes
Date: Sat, 26 Sep 2026 12:03:59 +0530
Message-Id: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFhnt2oC/33OzQrCMAwH8FeRnq20abtZT76HiPRrWtBtrloU2
 bubCaIH6yXwD8kveZAUhhgSWc0eZAg5pti1GNR8RtzBtPtAo8dMgEHFasZp7q+72J1OU81mhzP
 +GNs9VaoKutKGN9wR3O6H0MTbS95sMR9iunTD/XUo86n7NnXRzJwyWoO1FTgLvvHrLqXF+WqOD
 qcXWMhEZ/jiRPnFDMh5o8AqgKW3JU58OP3vO4EcNEEKE6SSWhU4+cVxWeYkctpqVktTCyf5D24
 cxydaGW7JsgEAAA==
X-Change-ID: 20260701-vpu_iommu_iova_handling-556e969a1f1c
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790404457; l=7299;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=Xdm/YCC4BeINIfT2Zgsi2yeNaax81oOmJezGAPhzjOE=;
 b=2f2u1JMql0qTpXt+U4i+n5xMoYhlcz+m2LiPfwnkB+a/7nwLkrzzT3X2ZfreFSuGQLBNZsOFi
 7Xj/2vM+1RlB6YfZZEghgH0I/4KHTWeSyRjwj0sxZVGyIDiiqdYmOvw
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfXyHoF/WPiO8G/
 JQygx2QXajgeriSRB0CJdbE0pA318rgaIv75Z0IpF65jivEEsx+A+WLMtyd73XSlHTkE2yIHO0E
 U/s1vV3H8KksIr7xuhP16OZymTJ2XboUDQRM03YOoG3sE/m9ktAgMFS9Zgr/17NfFNU45r+GUqb
 1Rfo508gzEydrRoCRT/iuINnuBEzJKauEhD83PqTDo09dhmEpP63rDy4yLUy1e0uOTjz4mxW9j0
 QUigx7RTeOhNTT1VZ1Sb0VpTRezGIv7l1h0UgwmCNHqTMX7t4cAvcDEv0nGoMZbh/ePxQ3KzAkP
 dOdJ8z8D8n7tbBqeF6hjPWSL/xA8uGIT68iOpzYmANeZ7Efx9h0b6ym9UZNBsv3zg38R/WkadWK
 rxd9jY8Dclmki9AclyAhYKkcwGz7rwXDS/a685gdpYRIsAPwmKoLS181n7XoT4BC18JjmQSfmxY
 GdClBuaUy7286p2T6tw==
X-Authority-Analysis: v=2.4 cv=QsXLTlyd c=1 sm=1 tr=0 ts=6ab76774 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=clIEwUPuL9h61AhfT48A:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: SXPljhyhde5qDMEOWFTGtaxLw-JngkYr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX7BPsa25+2OYb
 YjzmE1GVeCuyzi4PUhkB0u29s2E1xBfwYQ/ODP3O+iIFbWWHgSsA9JAzXD9mFfWbQNM5UHG3vgZ
 gzeqfcVI1Upji/VW54RClA3xz+SOExI=
X-Proofpoint-ORIG-GUID: SXPljhyhde5qDMEOWFTGtaxLw-JngkYr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260026

The VPU issues DMA through several SMMU streams, and the hardware does 
not restricts specific streams with specific addressable range. The 
non-pixel stream is restricted to use 0-600MB of IOVA space, while the 
pixel stream can address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+

A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing keeps a
non-pixel buffer inside the low 600 MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Fix was made in iris/venus driver to reserve the 0-600MB range and 
thereby prevent iova allocation from that range. 
https://lore.kernel.org/all/20260818-reserve_iova_in_driver-v2-0-5005a1154408@oss.qualcomm.com

Given that the address range restriction is for specific VPU stream, it 
should be ideally moved to that stream. To achieve the same, a subset 
of streams is now represented as subnodes, so that each can be 
associated with its respective addressable range.

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The maintainers agreed to proceed with the subnode approach to address
the VPU hardware limitation.

Reserving the iova address using "iommu-addresses" requires it to be 
placed in the reserved-memory node. But when "iommu-addresses" is the 
*only* property being described and there is no backing "reg" (i.e. no
actual reserved system memory), it does not really belong to 
reserved-memory node. A device IOVA range is very much specific to the 
way device own address space is mapped, and not a description of memory
shared across the system. Given this, "iommu-addresses" backed by a 
"reg", should be placed inside reserved-memory, otherwise, it should be 
defined within the device node. More info on this discussion can be 
found at
https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org

"iommu-addresses" property expects a phandle, which does not make sense 
when the same is defined within individual device node itself. 
Introduced a new property, "iommu-ranges", for the IOVA ranges required 
for DMA memory mapping to that device node and when there is no physical 
memory reservation.

"iommu-ranges" is defined with the schema PR
https://github.com/devicetree-org/dt-schema/pull/207

This series migrate vpu3x platforms to subnodes. All new SOC having 
iris3x or onwards(4x 5x..) should follow the subnode approach.
For VPU2x and AR50Lite SOCs, which are being migrated to iris, the 
subnode support would be added once the SOC is migrated away from venus 
to iris. There is no plan to upgrade venus enabled SOC to subnodes.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
Changes in v5:
- Addressed review comments in #4 which seems valid (Sashiko)
- Added RB tags.
- Link to v4: https://lore.kernel.org/r/20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com

Changes in v4:
- Dropped Daniel tested by tag (Krzysztof)
- Removed depends-on info from the commit description ((Krzysztof)
- Dropped the soc {} in example (Dmitry)
- Addressed review comments which seems valid (Sashiko)
- Binding patches depends-on: https://github.com/devicetree-org/dt-schema/pull/207
- Link to v3: https://lore.kernel.org/r/20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com

Changes in v3:
- Drop iommu-addresses from reserved memory (Rob)
- Defined a new property iommu-ranges (Krzysztof, Dmitry)
- Moved the vpu specific context bank handling to common(Dmitry)
- Dropped fixes tag.
- Link to v2: https://lore.kernel.org/r/20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com

Changes in v2:
- Fixed sashiko issues.
- Moved subnodes into common schema (Dmitry)
- Kept the firmware name as the one defained earlier (Dmitry)
- Added dma-ranges to specify parent-child address translation
- Moved context bank hooks to VPU ops (Dmitry)
- Updated commit description.
- Link to v1: https://lore.kernel.org/r/20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com

---
Vikash Garodia (13):
      dt-bindings: media: qcom,venus: Add context bank subnodes to common schema
      dt-bindings: media: qcom,sm8550-iris: Add context bank subnodes
      dt-bindings: media: qcom,sm8750-iris: Add context bank subnodes
      iommu: of_iommu: Add support for "iommu-ranges" on a device node
      media: iris: Add non-pixel and pixel context bank devices
      media: iris: Route buffers to the matching context bank device
      media: iris: Skip DMA mask setup when the core device has no IOMMU
      arm64: dts: qcom: hamoa: Add Iris context bank subnodes
      arm64: dts: qcom: sm8550: Add Iris context bank subnodes
      arm64: dts: qcom: lemans: Add Iris context bank subnodes
      arm64: dts: qcom: monaco: Add Iris context bank subnodes
      arm64: dts: qcom: sm8650: Add Iris context bank subnodes
      arm64: dts: qcom: sm8750: Add Iris context bank subnodes

 .../bindings/media/qcom,sc7180-venus.yaml          |  15 ---
 .../bindings/media/qcom,sm8550-iris.yaml           |  17 ++-
 .../bindings/media/qcom,sm8750-iris.yaml           |  16 ++-
 .../bindings/media/qcom,venus-common.yaml          |  97 ++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  15 ++-
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  15 ++-
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  15 ++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  15 ++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  16 ++-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  15 ++-
 drivers/iommu/of_iommu.c                           | 128 +++++++++++++++++++--
 drivers/media/platform/qcom/iris/iris_buffer.c     |   8 +-
 drivers/media/platform/qcom/iris/iris_core.h       |   4 +
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  |  16 +--
 drivers/media/platform/qcom/iris/iris_probe.c      |  79 ++++++++++++-
 drivers/media/platform/qcom/iris/iris_resources.c  |  41 +++++++
 drivers/media/platform/qcom/iris/iris_resources.h  |   1 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   4 +-
 18 files changed, 459 insertions(+), 58 deletions(-)
---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260701-vpu_iommu_iova_handling-556e969a1f1c

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>

