Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E31345EA3
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144717; cv=none; b=ot3RU0vxvc6qqGpQKd2SWqVON/M+hMET4m9KPqURe6ORv8H7XptRw8MfNiee5PBwX/aTSOO4DXTE/j0ES7OwduFD1iycFzP6YKRlFjSlFNgludZ3deE4q8O1boJxrIwb1Yyt88zDK6uZUyZBsTijv4ruSXuIuxWHckBmiabC9Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144717; c=relaxed/simple;
	bh=fOM6BaeYdlCaNXJHSFSCfjKqtXtX90PJqbCu0BgzIAY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ulmhiYTYKyIeCwoyc7GYYymtsQEyldfAM9HlGZPSS2OqG5m7Tl1AZa0/+N/+Cod3kPE7QSoc52XaV+oVp8i/PwCmnH6fljMDNJoYtpLHZav51XPe6BckbYCKWCOAJyyEUZScFb08FV1RSekFPL2vZ7XwTvAwuKMDmu9b/vznhgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IOV8xG48; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQskGYrw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IOV8xG48";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQskGYrw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0akk3600681
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HeM5xwcDuK+
	Wg+gJy+ElwNkTwE59trjiCqIy+PsKaZs=; b=IOV8xG48ylRcgOOlwPOkGYZDVVc
	sQaLZEzUHIMcQ9BbNqx5lE2Brg+Y2Dmv07F9LXYdb/4Yy5jsOyZ/lvau39g+czJn
	Sl7sF1vO4HezNhRgvHdLyuMxWMdHYwVNjS0zrgdrpijO9amH5Zr0Gn2hG/s6HpL7
	hbOp7957xeFVuNEtVsQzVeE/CeyqnzNFyL6fZbXVjjbgM0cvbK1fsSaIUqNiCEgE
	d5ssvWzZBoNQJ/Pv1IB4kVOQMZW/UeiLhb89rH0M5phPSxdPG5N/nhTkmnONJW4x
	VEjQja3YKCYznemEhS8jsGP4J5DuEGw9GYtIRCycoUWIsx4UBSM0gxj+p0A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm3abp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:05:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfd13d6d50so2227115ad.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 06:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144715; x=1787749515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HeM5xwcDuK+Wg+gJy+ElwNkTwE59trjiCqIy+PsKaZs=;
        b=eQskGYrweyC1WW3rtV9A7ZYX/E5T+MLMGtItdjjuvt9tOW7G9m3D//7wIZjKiwXXKl
         7aki+qztZ0MfEmL2dECLputV91SVQr7Ths52r9xdeD3aUxVQtDP1bvfEojh0g5s2F2Zk
         5Hm75GmOV9/ZTEuLEBx0jbl5xE+whHaclwSxrTtmJpHS4sTBm/WMsoYfv2QvQBiK8yYE
         FeWV15Ib/dmwJIZduBxWV0NHeUFtu3QMZEkiO0cxOMEIliC50RIQoqX6JxkoGId0ajJ8
         cWxqwUU4NffAiwuLii26mqmrf+zakjCAcm5Zrr+uY+wN1v7CqfBS4QX8T6c/6IvvwoLR
         R9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144715; x=1787749515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HeM5xwcDuK+Wg+gJy+ElwNkTwE59trjiCqIy+PsKaZs=;
        b=R2xwxDgflUVQxNxFtwPlc4I5TjkwUABH8mNkBu7FbqHHW5HQi+7ng682tpFqTQNN5U
         wLVcp5UouDJc7RF6n8+nGmbSG9C0B5yFzZA4QdJKsKLkPuv82r44tRbeRojaXQ/6SRWY
         qYV/sEUjs6fNh4KZ/O0Cb4yR1YCgcDWY9ddDTCl9gwDH2bGOj4WmWBo/QVIGsHLz4UUM
         A/0Ct6Lifz/tJA1QqZdt/9Yo7JMuinD7BQQQ0eQ+2O41MZV0TRa4HsX2h87NcfgEQ+sQ
         qIiJtZBUgt7XGMU2xxAlmQAZQyehn9hu4qnr4HokCaQcNc9VBFxRs1YnDZALU4Kc6whK
         gchg==
X-Forwarded-Encrypted: i=1; AHgh+RrW6jZtRsrK5rxE7bhXQUqeS0DSDuex0Y2RofoMg8PexzgfX6cEknRq7eK+KT6v9WWKmQzeog3yX5Te@vger.kernel.org
X-Gm-Message-State: AFuF++l1Nk5w+MN7dhm/y9J/+d1nEBigNlsUMXWwxxHpaEIWRXkkVKkg
	lItFLlM65i8A2L01n7RTW34hE+7F6udSV7oMij4fyh13gSjRolDPlq06KaqGwGHDUj9+9HlwVug
	cmSJ5z05jYPryKkksr+UqSEl9RVYke8ZugRGbL0aVz/t7PB/3WBQlQzaKH0/nNnVO
X-Gm-Gg: AR+sD12iGzg5n2bRMHsa4uAqGwYGdaDmqqIJ0odx4ZyjDY5DftTJkIpHnF7dfy4zEPh
	2Un3l1RnqgK0Ojl77EHZNJLAFsABpHcOqoLrNWVsX42AXqy8ORkbwcnTvumQV53W4jp1C9tjcQP
	mlgNqj+c9hFfppw3in+t9Biudgnq5x3+uvAfsBYWHnkeJfgIqdcOyy5Rw5Q0bDzMQqyl5LYGTZ1
	ws3n5VDMJnPfB1Bh3WleHqjtDmT8JNBUIu0ADemg9X65qBCBsnzSwuJ1qOpgNUDBF+DXVXmSC93
	UrtXg4jBqanS9p2VMV9iOA65MFDdRmcFkSeaSdT3+2DGu6H5BVTDsCnxtMAuNxZ61Nn/G1VD1IR
	ZiDoArOQHUgM9T5uhMJNWGm+3/d9uzRmEZ3sH2ifq5mFxOmiVkoA=
X-Received: by 2002:a17:90b:3145:b0:38e:76f8:fcbb with SMTP id 98e67ed59e1d1-39581281977mr3470401a91.4.1787144714325;
        Wed, 19 Aug 2026 06:05:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3145:b0:38e:76f8:fcbb with SMTP id 98e67ed59e1d1-39581281977mr3470323a91.4.1787144713679;
        Wed, 19 Aug 2026 06:05:13 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb304easm2697454a91.14.2026.08.19.06.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:05:12 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2 Key E connector
Date: Wed, 19 Aug 2026 18:35:06 +0530
Message-Id: <20260819130506.9999-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d8e189a3-a6ed-4f49-a1c0-74eff444a2f0@oss.qualcomm.com>
References: <d8e189a3-a6ed-4f49-a1c0-74eff444a2f0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LIa4cTgM5_sGtP7mKs-bSXZIwlpA82Gj
X-Authority-Analysis: v=2.4 cv=bth8wkai c=1 sm=1 tr=0 ts=6a85aa0b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=CyS4NGskv2rmVFwwadoA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: LIa4cTgM5_sGtP7mKs-bSXZIwlpA82Gj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfXysTEWaAsrx5Y
 H6HjKqO3e6WsSvSF3R71bb/DQiOlxOwNes8BP/sOtPIyu1cCcE2Tvu+sr05KkX6OxmTVAll6OHH
 My3Xr+AN+OiRUgJNHJ41S1Go3o0V0tORD7759VGSGchNp21pRIZ4APh+qfH7+gxnDCjzCvKBGZU
 7shVXGBOuy6GTgVSuShcJGleFwgw1nHO13UE/5lf20VojZ6JnupMqsTnPzePtJr9pYvZ8EtuYcu
 O3Vf7rzSnE/C6i3HkzWbl8Rq0Pwkd6/QbDii3a67Wx1n2YG8CqAgi9v8Jor6/al3DbyPF1J7ZP4
 ytOBl+vtHjwNgxWhosa9z+Q+sBCCuviiTAaH1uTzjdhgf8pUU3yGYfV68+ARy+/hC4hK0mwVfe1
 ytt9IQ5ME3aGvdjg521M/bbo6kfIEa+DKK8wtQoUdbHfixm05F7pCRO/OsbYUUTBrpaFYd2I1xy
 YrE5PxXki+hCJSHmnbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX4Nv/hrUjo2Y3
 pxs3fk4KL+56MFU3gWoIwfHbMHgEz3NC9fx8LMhW6BfvHH9gf/0zlBh/839Gv5CLSYyPcu33Pqu
 q3Gsp+uw2DnAx1orY37WYMDlQ4BEx34=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190100

Hi Konrad,

On Thu, 30 Jul 2026 19:27:59 +0200, Konrad Dybcio wrote:
> On 7/29/26 4:40 AM, Wei Deng wrote:
> > The monaco EVK has a PCIe M.2 Mechanical Key E connector to connect
> > wireless connectivity cards over PCIe and UART interfaces. Hence,
> > describe the connector node and link it with the PCIe 0 Root Port and
> > UART2 nodes through graph port/endpoint.
> > 
> > The M.2 Key E connector is powered by a 3.3V fixed regulator
> > (vreg_wcn_3p3) which is sourced from the board's 12V DC input rail
> > (vreg_dcin_12v). Both regulators are always-on and are required by the
> > pcie-m2-e-connector binding.
> > 
> > Also add the serial1 = &uart2 alias, which is required for the
> > Bluetooth serdev device to be enumerated on the UART2 interface.
> > 
> > The graph endpoint anchors (pcieport0_ep, uart2_ep) referenced here are
> > defined in monaco.dtsi (see "arm64: dts: qcom: monaco: Add graph
> > port/endpoint anchors to pcieport0 and uart2").
> > 
> > Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	vreg_dcin_12v: regulator-dcin-12v {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "VREG_DCIN_12V";
> > +		regulator-min-microvolt = <12000000>;
> > +		regulator-max-microvolt = <12000000>;
> > +
> > +		regulator-always-on;
> > +		regulator-boot-on;
> > +	};
> > +
> > +	vreg_wcn_3p3: regulator-wcn-3p3 {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "VREG_WCN_3P3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		vin-supply = <&vreg_dcin_12v>;
> 
> The 12v supply is not controllable, so we may drop it
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Agreed, will drop vreg_dcin_12v and the vin-supply reference in v3.

Thanks for the review!

-- 
Best Regards,
Wei Deng
