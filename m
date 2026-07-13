Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7654F36B07E
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934756; cv=none; b=tDBvdGF3uAB017fhBphfCINz1XtyLIqchj+b/mrUMNhdyTQuYe1xInIUmMb3zGEvkOSQD1nllao+Nfg6I0CPRx6U23Bm60hrMT9EbnSPrnSZe4uULpk9MWNxNUJV74dB2eK89IKpXL5Dt+7bubLNBEXfelbsaRXKQytgqqKyYmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934756; c=relaxed/simple;
	bh=IGwU/XzHL5SyWQ9S/hw4TQ6IbW+i1/eFqewpz5BZux4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LctlgIzpleSSg5b2sIPJBKAAjTuWnM5bJ9g1oT8nyti47cjnNFoQi9MJ+Q0UenFjX68q02jeE6Res2cbb0aDbRiYdNaliDT5ObOj113Lh/GXtnlsPUptIpe6LOgO+Hf48hWtJCK7rMA2L42lZLwsRnDH7/vIL+9oSWiYGcbVSDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4r0JED/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=URT92oqC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4r0JED/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="URT92oqC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7YpPm794362
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NbBmG6kgKD2
	CVzzcP60K4ZcdLZpgmeYKoleCsoDM+Ww=; b=D4r0JED/rr9wtjtCMM66Ly6auYz
	sm6/XhNXWNLB9C3tM/7oD3opkoU+aZjiiGdGe4jdRlPWE56PPsryex3GWydx9IT/
	vNTFlNrL4NCzV4NMMYqXzN6hW+n111kLX5uapuMMoUDJzoul5q1ScU6ZLrDRUxty
	qtsTfnpd5Qq2uRpH/cXbrlSf6D4JQtTLO5YFFDCynhZthA/oOMHat75UzB6h5qjO
	NlnLc+bgy6Mz/ojFMaP8awhQAID9mdBZ2VUdZbiiOF5iLaeVthLzgMJG8G6RSh1t
	eaWpXjiIio7M7VgVfc8DHJzgu9gsEQM8tcqC/FlMvstX/44QZcpBvVNpd+Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn0d5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:25:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca8aee882c4so282136a12.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 02:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934753; x=1784539553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbBmG6kgKD2CVzzcP60K4ZcdLZpgmeYKoleCsoDM+Ww=;
        b=URT92oqCOtzZMG0Hd/Ptt6yIQdjqB/xV0UepMtdQumP/0lBLbTdOpqDUd3M/XMQvhH
         k0pGKGkzFJiEypCBqy2fGJNIwinwG2Qtgv4iC2B+PGJ4kbFklfxOivsKmainrC3fpE66
         /W7UA6L8nDGZUTNCb1/iMP3Ot5NBkBPFmqzfGPBUW9oDaWjDRCqdk7zPEIvOLCsgCO6Y
         HbzkbBXzZhmwOB3rkp7UJGYR1y+m86YTBZV8liJexQM7flAty72IwTR+0k6BUbzS3cAl
         tj+5GW7xPl00mnVHMOC+Mv4JHLdGpR15CojcRTq2cUhWjM/+LvzQuas8bG8KOpDB5YQJ
         vFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934753; x=1784539553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NbBmG6kgKD2CVzzcP60K4ZcdLZpgmeYKoleCsoDM+Ww=;
        b=LpyvS5MWxJcWqB8a6c0Ur6hjSXMLNEXA2YNFMcEBDvmL5z00oM6/Res4tjQOT+8TSC
         ZTKIpDVxh5MaHiakg+6bHmbk/7USXuNivsvEvg9GdFo5ahc/8YBV3NYVzaL8VPxERw8X
         qJbh+u2lkvWkwoWDA6tBfOyqyzn58KW+vzvD+mr5UtQRuo5J8eST+1WUm7JMwi7Y33Z2
         hEjMBIq7tXtPZBjfOXNpBkbXTX1thWgMuJDDRzQtV3HJ3oBDMP+KD9YVc+xCbo9usMDB
         u0eHqDfU7S0GzDuSeRNdxUmeO1K8YOlOkY9oBlcBdPgbv3nABmSORzG4NZ+1ItiBl8bT
         KSeg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5PVU2KxBFzzLwQt9yIuukqhKlb1WOSK/GZZo0CbPLEOq7yVYAefJBC+C7R16GyKIMB8dJTag04Ibr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+CKmGzOHqC2pT+mZKeVw6LXppehqkhhFP2NIccw6EDvcfUG/P
	Hw/2TCBCNr5LbRLA0vDmQFwWajtIZgTJpRV0N4AHHyNM0TdNhWk9X0Q022rXMlCfrxIuTik2thv
	ALpdCHuMyUxIfV9CBRMP4NMa2UgEi/3dnaMZGiBMH7icb8P8oPh6V1IeZicpZ8exS
X-Gm-Gg: AfdE7ckNdwIteUEiJezaj4FeXQhr5Xzjc6ngcOMkCgLFMdG4HYV27OqoiUhPlvMrV2P
	QFAEVUabyaLyDen+1gXQe6Ra+3HamTPa70cRVQfe6UiBqwPpTSxsj5rucu0Bm/4gNYB5ucdVakx
	mALneCSc6yKE2KZxUc9EYlzJA0+4ZqJON+kraVTkY6hfP2zoeop014lwFTmaZFotA/u51bbNoFf
	xOzTq/tAQZbJ4M6IU18oM+c3nhUSZq0i7PetsMFLoxKXnndoLrOygwVkKw5lkDcfsbP/hWxFkbO
	KSlSTaNjOzKLjQxHZlwumLxf5QxJmLsCN8jfeYnHtWHhhYzo7iylwzER7LYH8rLa+wulNJU8x5t
	gvUUuG/tIxSNL37LotR1oJ+uxb53RD6EAtDVscUOW2sZjoXAWi4j1BeuLxq6vaQ==
X-Received: by 2002:a17:90a:7307:b0:38e:bfe:81e6 with SMTP id 98e67ed59e1d1-38e0bfe9036mr506239a91.1.1783934753194;
        Mon, 13 Jul 2026 02:25:53 -0700 (PDT)
X-Received: by 2002:a17:90a:7307:b0:38e:bfe:81e6 with SMTP id 98e67ed59e1d1-38e0bfe9036mr506220a91.1.1783934752667;
        Mon, 13 Jul 2026 02:25:52 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm67901497eec.18.2026.07.13.02.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:25:52 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, mengshi.wu@oss.qualcomm.com,
        quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: Re: [PATCH 1/3] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Key E connector
Date: Mon, 13 Jul 2026 14:55:47 +0530
Message-Id: <20260713092547.4100116-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <63643fc3-3a3b-4aef-96b4-de42498cf47b@oss.qualcomm.com>
References: <63643fc3-3a3b-4aef-96b4-de42498cf47b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wUTcwnU52yfgTzS2v01SCyAIR3bS9rVI
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54af22 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VjGlub7PaFdePbqR2KAA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NyBTYWx0ZWRfXzwKmwSxWSZd4
 fotdryCBQWd+0hXU2X1k+lAV5Ey2XswEP7+Fcg2mDesa0wbE08tJAmE8nSXEU6Fpw8PqoXWkvys
 08mPogaj2zjOK86gAYVk0mmiDj2RnI0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NyBTYWx0ZWRfX8DFuH6QKv8Ho
 Q1NXtp/j3BfbumuQhZTMt0a8ZDiY/Ts0Dc55bh/6omqjcSmpMIlt3VBO5RlKBra89AxPb28LofB
 InUOfUK4GEmpb5VRce58gIioJjKqtSqMaUPLSdasGOeLiHTyZTxYcEy4noxiZZkbXui4TgshlYP
 N5Yltg7LewNyyf+tQLVUYt5IT3jcNV/JzgXj0sfCXtmf3wyU3o8xLQbfPIuVwH1qlQnNeqE9ByJ
 Ae/9jLm7tGq9iYSurLqNn896y74b0AN5fK/MB99P6eo/Ynq9guiA2X6m0WVT2s0NxeVKdgSKaqU
 f0AqCMmj1RbD9tddpzc1c2hYRDlnDyHJDkYgaZQdiPtom2vqXy01NUHYfpRN/Y8NJQSMv4CatGL
 VmJi5Nwf4LOgg9kHZ8Pxz1r6DntYkBQ0KTHONoxL+d6bvbuQyRd60rYOx+5lEwemD+tXl4grlXL
 msZt0SkyOTJ0W52uzcg==
X-Proofpoint-GUID: wUTcwnU52yfgTzS2v01SCyAIR3bS9rVI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130097

On Fri, 10 Jul 2026, Konrad Dybcio wrote:
> On 7/9/26 9:29 AM, Wei Deng wrote:
> > The hamoa IoT EVK has the PCIe M.2 Mechanical Key E connector to
> > connect wireless connectivity cards over PCIe and UART interfaces.
> > Hence, describe the connector node, link it with the PCIe 4 Root Port
> > node and replace the static BT serdev under UART14 and the
> > chip-specific wifi@0 child node with graph port/endpoints, allowing
> > the pwrseq-pcie-m2 driver to power the card and dynamically create
> > the BT serdev device.
> > 
> > The M.2 Key E connector is powered by vreg_wcn_3p3. WLAN enable is
> > controlled via W_DISABLE1# (GPIO117) and BT enable via W_DISABLE2#
> > (GPIO116), both described as active-low GPIOs on the connector node.
> > 
> > Remove the chip-specific wcn7850-pmu node as the M.2 connector
> > approach replaces the WCN7850-specific power sequencing with a
> > chip-agnostic one managed by the pwrseq-pcie-m2 driver.
> > 
> > Also add 'compatible = "pciclass,0604"' to pcie4_port0 in hamoa.dtsi
> > to allow the PCI subsystem to associate the DT node with the
> > PCI-to-PCI bridge device.
> > 
> > Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > @@ -1025,19 +1004,10 @@ &pcie4_port0 {
> >  	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> >  	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> >  
> > -	wifi@0 {
> > -		compatible = "pci17cb,1107";
> > -		reg = <0x10000 0x0 0x0 0x0 0x0>;
> > -
> > -		vddaon-supply = <&vreg_pmu_aon_0p59>;
> > -		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> > -		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> > -		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> > -		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> > -		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> > -		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> > -		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> > -		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> > +	port {
> > +		pcie4port0_ep: endpoint {
> 
> "pcie4_port0_ep", please
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 

Thanks for the review!

Will fix in v2.

-- 
Best Regards,
Wei Deng
