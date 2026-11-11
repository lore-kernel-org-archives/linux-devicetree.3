Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407406;
	b=EzihUuHwjRZHsbT2XDU3tVC8luK1CLy6j3efZ+ph72ZxidXkbCDYQGyRp0uMHJlHqQnX
	 JflgPxSR0rdKPK6mbkc51agyCGMMQQcz8mdOxeycw9j11cCRJxdAmkxffQTbMIQlqf3+m
	 RKRi+VUhJZHfkaU5q5Cj9aT3p7Jfmtt85i8fooS4XRiFBhv+ZWCs9kfCdRsrhiMcNBWH7
	 fjcJOH4Mt7lB6fF1iRX9NSF9xEOomSJ6w7pSsY4i/AgWL1NE+hEyti+rlOcI/q0Ny1i8T
	 9x4yOT1i7cl+K6Zv/NJ8MrwuHDtLR6zjft0h6uEvzdmpkYx77qlp6fN0wpeZFSVznLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407406;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vGEIt+0d09kkbPmVgRK9KARCj2NgxxPeIMDPZW+376o=;
	b=cEnlYB5iabFVqMpDpmbB7oFmWBXKtXQUlPI9qaF0xrhpB0PSuILHOi9J0WTSabDStqPe
	 CJ89BgWvHVmJbG6Prhx01tRGvjo/ks+RJbcitm6BMu3K8ZTcv/T2BhS8orTm2L2h6m2m1
	 rhlFTBVFTdU/rxc81qzpZoOdAFtcvKtR/DvdJYkMYqgmK1ETzR+oCAs556Z/MrFQ+bkud
	 N+XQoKXrZdCy8aLY2nGg44hDQbr35nr0Uff38TNsN5dvrJNtxyCLWX7VLx2nEe6vuVUou
	 DFrRwaoQQM+LHzSRSpatby+wtzrA9+RihoaDmbSo3wbSYVqqrEybbi58ICILx/5ZIog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nxEl6DAq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X4AscMPx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DDC606A330
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 14:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82DDC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nxEl6DAq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X4AscMPx
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEKXom3510940
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 14:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vGEIt+0d09kkbPmVgRK9KARC
	j2NgxxPeIMDPZW+376o=; b=nxEl6DAqnVqU3uwhbW4/zp6ad3IRaesYmmV+nVZ1
	3ja+Jh5Nbo36D09D/fHZ2XN1w66Un7liWFyq95iL+h7LcoDsolwfjsvhgQ7D4cfS
	aK6VqcvLEk7jkHcxLCfmRhU8LTHnot3vg1uXgeL3zpc0NivLqrXI8f73QLWG2sw8
	xT6PGbCJ4x4CgEjO0ikVzhy3FohBc73bl0NogIQTgJrpNy7nfVB7QFpsXtXIv3ZV
	9L+cUvjSMRzvR1RbmDvF4sD09aduZClRpci/pE84CF0KLuYzYj8GD3qYSiXcjeLn
	ySPyLhX72ralf5SsOIjVNdgkkEVneHZMBYwNW76JJI1Qxw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1u81cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 14:30:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf7856ffso730175085a.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 06:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794407405; x=1795012205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vGEIt+0d09kkbPmVgRK9KARCj2NgxxPeIMDPZW+376o=;
        b=X4AscMPxrdED3fsmj1XunppdOq1XIsB9mno9fLW0GY5i+Dr5HYodA5su1Yq7ETub2e
         S7ASDcQD8hwhZX9GsSu2yNAlzBU05RC7wBELly5GZ/NoH5LcSqxxmSU8VwEZMnKv2UIZ
         ZpIGQD+h+iNMof+vhgWq7pgIvo3Kmay1kKi47zUzhe4LCrTxGEoh73VFfVz3uXU22hxj
         QmoGr57dR0FrfldhNrY7xcHVvfVGZvdWGwj6HGGUvtKb1vCZDItEdCpe6K7A7QQdmpQ2
         8yKLVu8LyEIt5HNCRIGSazPFXaIj60JBGyYdrePNQIzyCv3hls97dl+JHcWYUH/Qb8UW
         K7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407405; x=1795012205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGEIt+0d09kkbPmVgRK9KARCj2NgxxPeIMDPZW+376o=;
        b=h3ps3lO19wkGPmtg7T4hxE+aOufOb47zyE9ejNjIlObbFCHCQGxOOM5YyONJl6EhLo
         KjddT/b+3ZRtcwedOeI4Yz8v8zdulM7tAEeQ0Mxw9m+UzmzW11mEaYI6SROt/rsWbYav
         Z6V2ZFS5cw/4/kDYT5OYwySBJOU53UAFx/jgKcVFrO+jFkOE9p1ukB1mFefDq/rWosEm
         JdyomoI5NgSJrL39P02Wcce19y3eXE9wMoOahP4NND1ui8m/U4R7jp8DLCo0RGrKp1jM
         pLs3oLDi82ea92PD3yNNUnQhSX51wQNxKOZI18HDe4JtOwwrstV1GJ0s0qv9QKXqCJJu
         ISRg==
X-Forwarded-Encrypted: i=1; AL+hErEH1KEEIuWebpqkEPUEBNqFzBCOC/h0tVovLw82Sq79Fw33pGzZ8NFr/5/gCt1ifD2FwDTJOXcJB+4o@vger.kernel.org
X-Gm-Message-State: APuU4Z/J+2i51iV/L9HKaH0kC2i8DXkGHSjoucM3VokXTq3k9I8ewQSo
	u0pmgsEA/u1lHgqpf8Vf3ibgjVK7ooV0KK64gl6TRKkI8m89jyGLXSfTBUwXJenCu05f79yshc7
	m4woKnACLSmkKdVkiTGirI12V5uYEoRkuTOSCc32+1CrEAkrK6vyF5hjGC4ztxAfj
X-Gm-Gg: AYBFou2btWHWeu620hAXIyZivHFYDnivil6peR5GQGpzJuU898L/5OOcLJVMNrZUK2n
	8UPaBOrbRfu+SpEFDnwQsEMYP1ExeBo7Em9wGLOQcSyEfTamE9gTbAE82zRjViOwORio4br4Emd
	MXZqF0p1hrMc0IsF3OMJrI9mjXN9mCqb2Gnx1GFEu8eT0sA6mmYg8Ftse1P5KASSnjnJFc3EvJ2
	chk0SBD3ztPdVEdXK9xdBjaj9rfElbLLNWqeVm8qHI1iupMH08QLkWl/yXHfzZPg7K2R7qcowCc
	ciOBQE/pV7edrPUhB+sHqOykU6HGflfVQINp6JQ2CE8C+rdJvqwniFcOW3IQtmUua10RhzmE7Hz
	psnIheo1GlP6Bz4RoVggit7SGovY9hmnwjqsfx7usFieJnBFzjKHHcuYrQtdZsUgt
X-Received: by 2002:a05:620a:199b:b0:93f:1823:308f with SMTP id af79cd13be357-947b00cd286mr387696985a.81.1794407404588;
        Wed, 11 Nov 2026 06:30:04 -0800 (PST)
X-Received: by 2002:a05:620a:199b:b0:93f:1823:308f with SMTP id af79cd13be357-947b00cd286mr387688385a.81.1794407403677;
        Wed, 11 Nov 2026 06:30:03 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3fd2sm12095367f8f.52.2026.11.11.06.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:30:02 -0800 (PST)
Date: Wed, 11 Nov 2026 16:30:00 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        netdev@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com
Subject: Re: [PATCH v2 2/3] clk: qcom: Add NSS clock controller driver for
 IPQ5210 SoC
Message-ID: <zx5rw567pockk65r2joresyzjvytukupcrshtovnnyovmrmhba@tbrrnvlrebn3>
References: <20261111-qcom_ipq5210_nsscc-v2-0-7e2c1dda3ed2@oss.qualcomm.com>
 <20261111-qcom_ipq5210_nsscc-v2-2-7e2c1dda3ed2@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111-qcom_ipq5210_nsscc-v2-2-7e2c1dda3ed2@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NyBTYWx0ZWRfX9G2OU5P214z3
 Be1gKlGa/HLE3gbpjIID7oljeWFhMrEY5mOelhPB409kQCxPtXDQRazaQglm2XvmL6nvp2G2weT
 TDKMfsyBgXfOdf0iKtuVLI3Aj9Xkm5o=
X-Proofpoint-GUID: wk6RZpnj9G1N_7Qo1sY9IpI4EMhErQ14
X-Proofpoint-ORIG-GUID: wk6RZpnj9G1N_7Qo1sY9IpI4EMhErQ14
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NyBTYWx0ZWRfX3WWBrKqYJUqD
 Hti2hjA2WqYrO7tgH/aMxgAhM4Aet8K9L2rDX3//nRM4re809FgApGPh9cyTtaXSjvmgCbI7ws5
 tleXRtzrwShfiYBDVyXoaz8xAbDmFDW8mgfVzTXPO/iTT+/y6b/N48gSaFO1Z0w/7Ynp9ikbVwD
 HNLFLyg7tVLa2zjdVFdftP9elyzX3GX9fRtJUF949Y+BO6Vxpd5E+3WdXbXrqn5Dl8FjaXRrpHf
 /Gsfqsk98IW/sfrKOF8R/E/mrW1zSGM2AkP4upEBa6IAi8ReN97Hxsl/dWjF0gMnaYxLk8BVnQ5
 kVdNY4VK31H+K6eZ99qmR8WcUPZ0AthLBk5CdU1Du9JqvHQh+fT5nOs5si0x0BD5YdB3WXocgqC
 gJKNt3puXbqRZ2WhDMGVD/Y2iJpjlcqwq3Pca/8MbeuX/ZHzhkowhAY2q5HYOOtI4yCbzH+BWkV
 mlaR5/FltrSvYzBBDIA==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af47bed cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=XlM99vnl-FaGDs3XFu8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110057

On 26-11-11 02:00:56, Luo Jie wrote:
> The NSS (Network SubSystem) clock controller provides the clocks and resets
> to the networking blocks such as PPE (Packet Process Engine), UNIPHY (PCS)
> and the integrated Ethernet PHY on IPQ5210 devices.
> 
> The icc-clk framework is used to enable NoC related clocks to create paths
> so that the networking blocks such as PPE can connect to these NoCs.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
