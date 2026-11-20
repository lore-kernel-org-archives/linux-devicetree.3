Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182148;
	b=HBV7eGf6b7x2DDquKSY5Jx7OMsi6hYLkS0d/CMqpj7djRCPndg6nD9QAGW2dVEd/K/lH
	 Y2niP9HzAm3pd6e/7LixPAOLhKqNrqjiVYyg9t45SV7m/vqidYMwvNCqHPAUf1aB7sSSu
	 dURHNu+Z0/Ya9Cu8mLYCExuestv0zcrDV+sXzoKilsJLuQlUDXI9o9Q3x+kJDCG/2JJkE
	 OMI5WhuRBN3V1UDZOAIzX1d8JSTCNSyt2BDgXKQ8erY5Q2avqmDPKBX2jOnm5nE+LT/uU
	 t8eppkQMP+5iKwy2EhKShS1BquHauTda0yW24Q42J4IG2Ij3Oc1EQxP43FPeKhJXjzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182148;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YETMORu0EwmjXjFiIGRDhxEkjqRjM/MriqWWStXTlnM=;
	b=UVtdqceS7kdrDlZN5vzPGS/toms8NXTwoS4128hKpe3H8cBNJWaFMmdE2/NS1SQC5s6I
	 HLkSGEmT9XeJnauPX3dCrN/qe1tNV5t6cOBfY9mq8yOCV4958jbf+/2F0ORkWQSVlhk4w
	 j0+fYIz+CfNc5NbUgStYD1jPjOlEMTuKgoV9ZK1W666r2BWSuSH1DywCL0JvQ+9p3ZBJR
	 6VbShcRrlnlNeNYyqi8sgIhLoGzTPA0K02DXHeTe+IncPv62wKVVQ4i1R1pd1p0RieB/z
	 plFlJ86YMTehS0Ucy7glf36rn29cSeXZNQsYR/QLwv89dEXQdaUMQYBFUKi7fzKvj/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4EGHd+t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZJEyr8dN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5542606A32A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5542606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4EGHd+t;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZJEyr8dN
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjtK71528508
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YETMORu0EwmjXjFiIGRDhx
	EkjqRjM/MriqWWStXTlnM=; b=D4EGHd+tVRWg4U09w/JD4wiYraxbgQO3SUN85+
	StDapF3TZJiv6K7eAzaj+uyiGeyfyYoDLFP5PA9+tgfpTqwA5AWNXTKMatXUZ6T6
	SwTKQmy0tgUL3qrluBGmmDqHuhD4INyWVfD9kyizv49BpqbHUZ8DuoMao+4y0RN8
	njND0851JusG1OjyeeKgsBUHe3uEKLch2sRRBHdT+oPLmt90KtDxoaD8AeAcJL/O
	dpw+ukwxO9p0XuLiVuHAVCGXyleQb7Cr+mHW+yqzXuBSTdvc8VRAWMJIER3IMBbM
	No9Cn9U01SM9DsazpmVPctnHLxgK047/R+VMWRy1yUGZyPTQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtt2h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:42:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386177b0516so1464326eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182146; x=1795786946; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YETMORu0EwmjXjFiIGRDhxEkjqRjM/MriqWWStXTlnM=;
        b=ZJEyr8dNdlNuvLit6gRaSh9HY4UgsaEvo+kOJwNobileflASM8vWJOwiyD7WFy6XuQ
         ypm3hE3jtalVqRKFS+VFRcsDhEJzKTmINELcPy+rugJOZo0oKU8R2P1D8Fv9qlLbIa7n
         PnwhEnzRQaswomeBNb7MRXwHuBmf0tDbH3CRZnYz/IbjjsFU6LkNMuKmRT7dZqqUZOgz
         jh244chJFAP2blExis3bLy2iVnCp6kduwi9h1NmYJlncUqxDzo+N6vCbrJkoodFmjIp8
         CSMLil1aJNA07vfpACVe/4/po5M/VRZLs3pF23VaHQWZy7p6dA+U6c0/wt9q4HDj3uUV
         HAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182146; x=1795786946;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YETMORu0EwmjXjFiIGRDhxEkjqRjM/MriqWWStXTlnM=;
        b=03IthzMkV/Y+GQiR4Z9rU0PTZGbS4zuvlu9ThZsp+S+6uvMNXrS8ITmJMStxyQQbs3
         YKTtLPtxg8PHe2a96T6L/sAhyK1herlIVuLiorI2id5fZ/Texe5nW18ZdbIyeAN+h75O
         gMK0gQWh2ZTJve/3iZ6YAi0HPyphDveGiX8tGXYXgqC/SDRzk92Jms9b9NvafeBRifZf
         am4N3TXcLjSN3jkSUBsh5rDvKc/OpEgvVZnbvO7w90GZAb5RRawRLHLCIWve0x0Ht1L/
         KSKaTanTZS5qnEz1oUyOo6Z+352F9+cUUbuMEWP7OOoXdjG92S03SIaySsX+xzgbEXJC
         YyUg==
X-Forwarded-Encrypted: i=1; AL+hErHUF9IgGxQZTVearlQpSOP5zUnZpUEa4rQ3Q1FrglgkeopMoorXWJdLVcImd/GWOxCDUb7Ih3ZJHPxn@vger.kernel.org
X-Gm-Message-State: APuU4Z8Sr9qqaFTHRwn9BCeBTXxbTOghym+sHH5cGc/zxBXnbnvYubWJ
	XruDzEPyZ1toXWiHY7W3tjCaiwGDHK3jpRtdrOSEq1syIQKZHv4XXA9XUpVwir1yYWWypqctm79
	8/yGTt8JgRx1QGpy9Yl6wKs7Foz2bn2UQd+HVPdQe03FvMPRMhbP+eXLoOYWYn0c4
X-Gm-Gg: AZFdTZdFnwRjQijNM9qwlVu8hwZRTtRREVvc8AD8cZptA7gpkdUQpW76IqaThbhWJ2v
	gJVnxIpztx52lpt+EfGu0mts1wWVXBO2KxLKLKrClSh734lluOWEraq6Zsd7ZbnN1nV5l6RoIDX
	SQwvJrFBmRb0faRbyBZCAkg7k2T9AcQtujI/NONDS7u/KoJph9i+RNHTEeCbLtOLsdfycxT5fuV
	UH31jzEmbrGhzN1UNsCz1ny2Wmf9NUQaBeyJQm2Iw1OVGyroljFUrFWR0sm4+Hi6hwXlOQkF1ga
	js1BM0LANDDVXZUW4d5LLBju945P7hgNgecnzOMaSd7K+u6SQlSK0oWd4ocFE0e6K7+RY0Amgrw
	jP3OC1YhRB4P3sC0pbv6Nh1p+GbibN34403l/4nt/nwqSA6G7dWSTEzQyko71PC+11he8zIz7ZO
	G3qAg=
X-Received: by 2002:a05:7301:dd86:b0:351:2958:1740 with SMTP id 5a478bee46e88-3856fb641famr2813683eec.37.1795182145371;
        Fri, 20 Nov 2026 05:42:25 -0800 (PST)
X-Received: by 2002:a05:7301:dd86:b0:351:2958:1740 with SMTP id 5a478bee46e88-3856fb641famr2813631eec.37.1795182144436;
        Fri, 20 Nov 2026 05:42:24 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:24 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: [PATCH RESEND v4 00/20] iommu/arm-smmu: Add interconnect bandwidth
 voting support
Date: Fri, 20 Nov 2026 19:11:31 +0530
Message-Id: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAtOAGsC/32OSw+CMBCE/wrZsyXljZ48yNWDHg0hfaxSI622Q
 DSE/27Bu5dNZjPzzUzg0Cp0sAsmsDgqp4z2It0EIFqmb0iU9BpiGuc0i3Lium5olO7RCqM1ir5
 hUqrex4jcZnmRJRluZQEe8LR4Ve8VfoFTda6OB6h/fzfwu88u5MXZKtcb+1lXjOnqXwqjKKb/C
 seUUCIYLxFLjpQne+Nc+BrYQ5iuC/2Bep7nLzgflPvlAAAA
X-Change-ID: 20260516-smmu_interconnect_addition-d9567535e9d7
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=7804;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=jUDvZazO474CIj6UfK9rrKEEe6NXIbdeQpztmygDkp0=;
 b=Oz0AHVzotegR1lX+57u3OLv//lRYW7v2Ee3ue88L3mdvsW6UaoFAQQXyE8ps6BDj6Ij2u13RC
 gCl4ptkMWSIDmubhzASYZ+eSUIZObaxNIRWc0TcxECBUSbp4JIiGCuq
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: UVxNvTo8YcL01SKk3G6APltritmpMyAb
X-Proofpoint-GUID: UVxNvTo8YcL01SKk3G6APltritmpMyAb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX1dkCKvk9QPQZ
 fDdm5mLHFQX7aqaSGFZUio+0ZqYi8P7VOnBf+0OyPb5PpIpq5SQPWxpo8tIGsaUmkswTjgHn3Io
 Tu9Fd0PeHKXclzhhdGyjyv+TE229u4+wERlXlXRYJ6HLDZ5tVGWxLUeI26VWkOsG8t75cz0jXzK
 tbHwgbB6HoM7cechz529Lsfbs51eaoTXxbvlHpBgNZHubIC3kYfohRGtAZMDBo0LZyAkhDMwFIA
 SpwXFkGSO4fR2jtUI90WMG5gn3B1WzqpW35AWiThaaNLNBQQ8+hHP8rcStlvzcKTis9F0PcX6yq
 CSQhHTNk/tsm+cThuWURbzjKs4QRammJ03t6QB/UQ8bzmrN0LIiNrjhNUAJMxzqNw4lVzMLv0TT
 1thboIHU8JqNW73W0JCgXtgSvncb8KU5/XrBUWLSWslMbcWyBMKRynZaNwSLM9Q7MW53q3d1QVJ
 JxvK1VUHfJYJegI8vuQ==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b004e42 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fn02ttKd-iuB0E_vrvUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX6VqS8rXSU/YN
 4m0S1ksvIE/oAeg2FJvWxNCBOCQPgYz+yyf0SCga1eK2RzdzAuIio1ZmC2/u7aGPI7Nyzo3bT8C
 vP59YzJve16RDoDwhGzBIDwc6ejNd2c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On Qualcomm platforms using the ARM MMU-500 as the adreno SMMU,
the GPU TCU is a separate hardware block with its own AXI master
port (alm_gpu_tcu) on GEM_NOC, independent of the GPU rendering
data ports. Without an explicit interconnect bandwidth vote, the
GEM_NOC path to DDR can be left unvoted during sleep/wakeup
transitions while the TCU is still active, causing intermittent
SMMU register access failures and SError aborts.

On earlier platforms using QSMMU (SMMU-v2), the TCU is integrated
inside the SMMU block and shares the GPU data AXI port, so no
independent vote is required.

This series adds interconnect bandwidth voting support to the
arm-smmu driver for all Qualcomm platforms using qcom,smmu-500
as the adreno SMMU, starting from SM8150 (Snapdragon 855) where
this topology was introduced.

Changes in v4 RESEND:
- Fixed accidental gfx-mem interconnect-names field removal on some
  platforms during rebase.
- Link to v4: https://lore.kernel.org/all/20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com/

Changes in v4:
- dt-bindings: Changed interconnect constraint from items:-based
  compatible matching to allOf/contains: approach as requested by
  Dmitry Baryshkov. The new form matches any compatible string
  combination that contains both qcom,smmu-500 and qcom,adreno-smmu,
  rather than enumerating specific compatible strings, making the
  constraint future-proof.
- iommu/arm-smmu: Moved qcom_adreno_smmu_icc_init() into a function
  pointer hook icc_init in qcom_smmu_match_data as requested by
  Dmitry Baryshkov. The init is dispatched via data->icc_init() in
  qcom_smmu_create(), keeping the hook architecture consistent with
  other Qualcomm impl callbacks.
- iommu/arm-smmu: Replaced #include <linux/interconnect.h> in
  arm-smmu-qcom.h with a forward declaration struct icc_path; as
  requested by Dmitry Baryshkov, to avoid propagating the full
  interconnect header to all includers.
- DTS: Extended platform coverage from 4 (kodiak, lemans, monaco,
  talos) to 18 platforms, adding sm8150, sm8250, sm8350, sc8180x,
  sc8280xp, sm8450, sm8550, sm8650, hamoa, kaanapali, glymur, milos,
  hawi, and sar2130p. Note: glymur uses hsc_noc/MASTER_GPU_TCU
  instead of gem_noc; sm8550 and sm8650 use MASTER_GFX3D instead of
  MASTER_GPU_TCU.
- DTS: Kept QCOM_ICC_TAG_ALWAYS (not changed to QCOM_ICC_TAG_ACTIVE_ONLY
  as initially discussed). The GPU TCU is a separate AXI master on
  GEM_NOC that may fetch page tables from DDR during CPU sleep while
  the GPU remains powered. Using TAG_ALWAYS ensures the interconnect
  vote is held across both active and sleep states, preventing the
  vote from being dropped before the SMMU is fully powered down.
- Link to v3: https://lore.kernel.org/r/20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com

Changes in v3:
- iommu/arm-smmu: Moved ICC voting from generic arm-smmu.c to
  Qualcomm-specific arm-smmu-qcom.c via new runtime_resume and
  runtime_suspend hooks in struct arm_smmu_impl, as suggested by
  Konrad Dybcio.
- iommu/arm-smmu: Moved icc_path from arm_smmu_device to
  qcom_smmu to keep Qualcomm-specific fields out of the generic
  driver.
- iommu/arm-smmu: Restructured arm_smmu_icc_get() error path to
  exit early on success as suggested by Dmitry Baryshkov.
- iommu/arm-smmu: Dropped if (smmu->icc_path) guards from
  icc_enable/disable since icc_set_bw() handles NULL path safely.
- iommu/arm-smmu: Changed WARN_ON() to WARN_ON_ONCE() and
  propagate error code to callers.
- iommu/arm-smmu: Changed ARM_SMMU_ICC_PEAK_BW_HIGH from 1000
  to 1 kBps as a minimal keep-alive vote.
- Link to v2: https://lore.kernel.org/r/20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com

Changes in v2:
- dt-bindings: Cleaned up 'interconnects' property description --
  removed "Optional" prefix and driver implementation details as
  flagged by Krzysztof Kozlowski.
- dt-bindings: Added allOf conditional using 'items' to restrict the
  'interconnects' property to Adreno SMMU nodes only (qcom,adreno-smmu
  with qcom,qcs615-smmu-500, qcom,qcs8300-smmu-500,
  qcom,sa8775p-smmu-500 or qcom,sc7280-smmu-500 compatible), so
  non-Adreno SMMU nodes on the same SoC cannot use this property.
- Added DTS patches for kodiak, lemans, monaco and talos to add
  the GEM_NOC interconnect path for the adreno_smmu node on each
  platform.
- Link to v1: https://lore.kernel.org/all/20260516-smmu_interconnect_addition-v1-0-f889d933f5c1@oss.qualcomm.com/

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
Bibek Kumar Patro (20):
      dt-bindings: iommu: arm,smmu: Document interconnects property
      iommu/arm-smmu: Add interconnect bandwidth voting support
      arm64: dts: qcom: kodiak: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: lemans: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: monaco: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: talos: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sm8150: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sm8250: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sm8350: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sc8180x: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sc8280xp: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sm8450: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sm8550: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sm8650: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: hamoa: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: kaanapali: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: glymur: Add HSC_NOC interconnect for adreno SMMU
      arm64: dts: qcom: milos: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: hawi: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: sar2130p: Add GEM_NOC interconnect for adreno SMMU

 .../devicetree/bindings/iommu/arm,smmu.yaml        | 25 +++++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  2 +
 arch/arm64/boot/dts/qcom/hawi.dtsi                 |  2 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  2 +
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/milos.dtsi                |  2 +
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             |  2 +
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  2 +
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  2 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/talos.dtsi                |  2 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         | 50 ++++++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h         |  4 ++
 drivers/iommu/arm/arm-smmu/arm-smmu.c              | 29 +++++++++++--
 drivers/iommu/arm/arm-smmu/arm-smmu.h              |  2 +
 23 files changed, 143 insertions(+), 3 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20260516-smmu_interconnect_addition-d9567535e9d7

Best regards,
--  
Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

