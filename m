Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94203B8920
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778488318; cv=none; b=Bv/ATEm1ncjNkD+oBNhp0X77oVjHO0wk16uy+bzrFjgDNH8aZOHs3nL0GbtkEn7JeWs2Nb3RxcfZvXIdImuMTdduJyp6KgBUKZeegnOWrKf+D+ku86M5cddQ8oDHQa5Mzas0k9bHOONbQgh7qeBc1cOW8DeCBoFb9LQ90bF0C+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778488318; c=relaxed/simple;
	bh=i9tc7b3tGnPfVh4mO5DDcpk5QiiUsLZXH/ljNKWngJ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cUhCFbGxr42Hsoj6+NRW8Uk8YaGQRBWOnv1HVzlskPbeARpwPztnxmOUnVraBjKVC9x64R0jsAkgpfR/DmjmyuGWZheR+42fe5fo4wonymAaCnRtdsU+gHVqdxPU9XGHDX99vOcTHVfIn9yjtKgHTEcfWQwLH1rrxPErjbPhRSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UE1MQHTN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MYv9ZYwo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UE1MQHTN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MYv9ZYwo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7AWvB453615
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	liNuFjs0lWZuIiFKHVxV0Y8he+FIbK0rAFC9jD6OJfc=; b=UE1MQHTNKmIIkV/g
	IdjogApqjJzYuBNq48UcVmK9kYIH9MMqjYki3DzKkC3dqs9QepTnNfgtQaf3EqT2
	kGvD1CvhIS9/oDrzftuxekEBljeFCsiECbp4ZnaWLV1yhzQEgsAqQJ3aWjBhE/QZ
	kKz7i+fUQTumDI4sE/oGzM6LiYVoiSa9J7l70vbwvoGmXAx9KPjg9W/WqCq54Q4q
	IV3gl5iVON+Ah+cdzmtyEspmYy6RpQrs0gLwatD0GkjbdPJXIk+dP2sCPZlv5DWY
	2Z4KddSZaXmGRDYNr4twTCNWdT0dx9Ikw6UE8GP/TOZa80iEHdltoR82gKn2zpLV
	oTLX9Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag6g98p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:31:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8375e2df478so2047000b3a.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 01:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778488310; x=1779093110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liNuFjs0lWZuIiFKHVxV0Y8he+FIbK0rAFC9jD6OJfc=;
        b=MYv9ZYwoH5ylsBtyoBPlTnJJYdvcKcJm5PUzdyLvc9MzKerCQ7nrjJt1CtHLC0BY9R
         vQh6LXOOr801nzLuYzZ0cX+0cwdBwJKo0EH+2z5wyeSfCLDIyknsEcXKlRQ78i79AxTP
         TI/mu0stCehCA/mTGLO03X4hXztq3rLOQSXyER8fIEZqIZFZC41130GcDYXKLOpr01ix
         0FhAOArgrGP2PlSDEbU2FUG4pUJqMNEVJmqxSVD4Rj8/yeP9tChX6DLfkCK5aGeaMuyJ
         PEyQQciReV+7dRyz3DdsVQljOEOb1yTibl8PWIOFqg9rJU7CrONeRctWAyCFVMVg3Fzu
         2Hiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778488310; x=1779093110;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=liNuFjs0lWZuIiFKHVxV0Y8he+FIbK0rAFC9jD6OJfc=;
        b=olBtXS88PvT8xlHNfl7KYFz/YlRrmgV9jgmJZl0NPYuOUUjiHJKpE9McsoGQHKJwNn
         jDH6pbx1hS/pujVPcsGz+FtOHJ84ZyXERaPx7u5ig4Rzy1NTsxXSaqXbJCzQnWO5cYNY
         AxzKk0/tCjg7wwVOu5Im+P/jo3r5gvUGOXNQQTlKjjtjQMXorNx+yFhNecZDRwNCxcQe
         CzMaNHxAis4o/QYtCEZlKE6t4SAUudo9WtUpqnhPJ+kDzgeejf9JCUzxeknLct0jzJfD
         IYjmPSXKIbrk//fStYpWLZsEWbOV+gdfa6sssVSuY63+M0IbvKdhw+2v6ngYkMIBKVUJ
         v//Q==
X-Forwarded-Encrypted: i=1; AFNElJ9QQK8VXxPxxBYcYGWBJC95MxmatI3EFEKvBj+A5AMPV951EHQJzLnuR7YQfWIgQtxYkfVh8BbIEcQH@vger.kernel.org
X-Gm-Message-State: AOJu0YzvznTUV6fQ6gigkamLi/K9WXYN1L735DW2WHshoUKUt7qHtAuj
	T9lzbfFECTb3E8FwjNk78CjxOIiqoKhmAI36w61FxMxfC/chU0JJ1uvfnh+O3jGX8QoIpt1V8bm
	CQ2n22SfzyvN6s3zO+eHpsUWkvol+UhoSWFLumD+cPxTP6bBogQqwYEHrN3kPVQoS
X-Gm-Gg: Acq92OHAKcKkTo9V5q3G36Ry6CcSWZ9DrOfXX91cLPYlMIuPFDcCEjsErZkCVmBqa4s
	DakM9YpL+7GthPI/OQq5aRqq8MOwA0pNvkMs1zm79fHkBzW0oO1Odsrhq9BR4GuHxQuVfc2hvjR
	VwLV2isUyu4ThLu+LNreMM5FiQFD0NF6Us+FBapAu80cRYvJKi5WH69VmEQjSBsvbucdixsJcJL
	nyNLv2Q8dst8uv+0sEgydkNCj3Q1pgDbvGC6Fkbpz6LyBzKR7AbFoCxZQRes0gNXIV7Af9F3Xec
	7J8sxxjkl4WuKoQz97XCbaKfb/3u0YmS4xqxTii5r27T+pGXjYVO33ij1ct2XyuF8wSk+WUtMen
	Fdu3wQVIleIfF5CE/
X-Received: by 2002:a05:6a00:310:b0:83d:446c:2a8c with SMTP id d2e1a72fcca58-83d446c2bb6mr8897236b3a.25.1778488309788;
        Mon, 11 May 2026 01:31:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:310:b0:83d:446c:2a8c with SMTP id d2e1a72fcca58-83d446c2bb6mr8897201b3a.25.1778488309228;
        Mon, 11 May 2026 01:31:49 -0700 (PDT)
Received: from work.lan ([2409:4091:a0f4:6806:dc6a:a003:bc2d:d67d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm24586408b3a.3.2026.05.11.01.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:31:48 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Xincheng Zhang <zhangxincheng@ultrarisc.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jia Wang <wangjia@ultrarisc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260427-ultrarisc-pcie-v4-0-98935f6cdfb5@ultrarisc.com>
References: <20260427-ultrarisc-pcie-v4-0-98935f6cdfb5@ultrarisc.com>
Subject: Re: (subset) [PATCH v4 0/3] riscv: Add PCIe support for UltraRISC
 DP1000 SoC
Message-Id: <177848830296.12802.14978169328629266559.b4-ty@b4>
Date: Mon, 11 May 2026 14:01:42 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=fOsJG5ae c=1 sm=1 tr=0 ts=6a0193f6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=l0vRmO6wWID8S7eiZWwA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA5MyBTYWx0ZWRfXyl0unV0YsoRj
 Y5pD8D8ICKmFf0yhLX/hlqQge5JNpjZqtX9Murd8+qLlZgmKe4286Pd/YJ6dKae4cg8FMKB212q
 dNs791MZ2gqwcoLty6eVJhHCjHAWZdMQaNeU0Ic+pZci8o8M4DsEDqbcmbWVY9e6eQqjeu/CdcQ
 hle9eUloA+XdJTgUCLpvwW5LPyBsTHVUmg/CO9XmporxA+lz09CeIXhyAf+50LXHx+Yjolkp3ZT
 ev/S3z4dtvp76cuKE2w1zVjyZwqGi3mqs1ZjwTikdK38fuE2kinBRHYjy4ImcmNfiTXSs4b23b3
 9CkiQmX0630pYL531/NRXUZ+UHMaoHvrH3xP+MZj3avuNFQnMI2ymcjjhO4+YKgW6wFom3sC/fO
 xTu65iAxipAva7HTs4G3Xl9oyogzfrJf3w85LcyvEbo3glBX5YbGrBCLpBcR6vZpLuOm/zJCFwo
 WBBHcT2Hto9XwE+lXDA==
X-Proofpoint-GUID: Z-gTRYBKrnfgKtOumuZy74gcwtPpwqiL
X-Proofpoint-ORIG-GUID: Z-gTRYBKrnfgKtOumuZy74gcwtPpwqiL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110093


On Mon, 27 Apr 2026 09:32:09 +0800, Jia Wang wrote:
> This patch series adds PCIe controller support for the UltraRISC DP1000 SoC.
> The DP1000 is an 8-core 64-bit RISC-V SoC based on UltraRISC CP100 cores,
> supporting RV64GCBHX ISA with Hardware Virtualization and RISC-V H(v1.0)
> Extension.
> 
> The PCIe controller is based on Synopsys DesignWare PCIe IP.
> This series adds:
> - Patch 1 adds the basic SoC family Kconfig support for UltraRISC platforms.
> - Patch 2 adds the device tree bindings documentation for the PCIe controller.
> - Patch 3 introduces the PCIe host controller driver.
> 
> [...]

Applied, thanks!

[2/3] dt-bindings: PCI: Add UltraRISC DP1000 PCIe controller
      commit: 09b78d6ec24624c2f5192dbf0c6e05cad61c529d
[3/3] PCI: ultrarisc: Add UltraRISC DP1000 PCIe Root Complex driver
      commit: 34f9bebe1cf573cf9735a71c1d484b57f65e5314

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

