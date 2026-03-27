Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FAF322768
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624756; cv=none; b=kEXn+0AEODqf3mDHMJaUL8xej8Ld3j3qf/EXgd/KJMZWAk5zvMFGe0YVLDyYzfjAtASAjw7AmEV1yAUnqTtBw565PUx39gI2Wae459qeGYn5gKbFIa9E1JCA2e3bwMKG+6LERjW94I8AhA9CVSyaXtLTUaSI2/GcvvMO7F/xVMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624756; c=relaxed/simple;
	bh=ht2Iz5o3NMrdX49tOUVlYi7UocdxS70H8zgzEcKwQ5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2g7zMHjNko2taQhfssExEZ041m3vJjk/8Zr4LAIAX4rwu6/NOxESzlaf5A1I3ZTgVqyFM/ORWktQv0e8cb8rzz2La1K/sQj7czHNw0C6aNb8ITYv8EXNLAFaLjQ80FLg5MgnjBrz8Gzr5yhFuFIptduyz7DJ/8n+osH8l0mTkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=moFdYnWD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OQJsq/2b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="moFdYnWD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OQJsq/2b"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RF27B33630874
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=67Iqn9pPGhPhV30esW0aw8Wx
	qlEOmIiygQoTzBMt6dw=; b=moFdYnWDwnnc+9d6xvPpkxBRqWZYvOcJV1O9e+AA
	pygK4BwqONFjz/lAhhjuUcqwEPSLIUaCZC0ZJZkFHPdmlxIdWMgKMoO/XwL6omvH
	Ay4/MVsYDhy+V40FrbekKm9Eg+BE8rlqE0enyu0EQiTPn45fR6NRIOp0Ttfbn23N
	FYjZL8wrWZf2H8XXeLokccXYJUD/Q4vrgRY5k2GA11/TjfH1Jw1m1NUSyMW2nZqq
	uV8lU1Ed/WIJIqKyOxhoglss6jSkYANrpnKgtDIqSw3VZQGW/0vOdiYrxOwBp6Fh
	UH/Tu6/9yIpy9Hqz/ZPWl7UT1TpLmHSPLgB6Ifxe+PBKCg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5v6b01v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:19:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso104873721cf.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774624754; x=1775229554; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=67Iqn9pPGhPhV30esW0aw8WxqlEOmIiygQoTzBMt6dw=;
        b=OQJsq/2b3MUygvHK0arEh7ianG1jSaxM76zFKVcW1hA5Roz1Exll6xTtk6u9+bYOmr
         maoyPcm8rob598irl7VRE1+dOCkgLEv5g1YAUbZREwG3DTY98YFKqnrVZmhDnaySGfwB
         wDOEzzqFM4TusSa/Z+bgi5wPeYCkVRiuS/w2S7aZ5i92txOxRiX/sL8JSscAvBdnZbf6
         wbyIy5qMZKtrbGTdPhEMsH0/XdkC7W+tO0rvrkNmW+h/B2ScNCq5xSnIcF5n28SadZ5I
         31zpj1WhIl6PV5VmUvTXWGtQlU9MBjJ8Inz6sEpc8X75jpYz8YoQViRdoz4fk2qANafr
         Z9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624754; x=1775229554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67Iqn9pPGhPhV30esW0aw8WxqlEOmIiygQoTzBMt6dw=;
        b=d0dGVy9qarpDI9hduVzUvWIwhuwX+4/vVoxyw6A2w3VtuGYxBATapFdmHLvZgFoOLT
         AhILw4xfoRBIrrZo3YTbLmDEuUlHh6Y6v4wmzqEj0kNG+YLtNht3SxpYZFpS0CaTQ+cc
         75hsTBvoXrnPUkOxVg4o9kFS2u2M0GtfhsDqk6XqegWXIld0c1TzXjLlOdLaNmxZDju2
         xA7VONW0txjB3h2F0oEHNGebABCSXTrZ6zwQlJOttMzlHk2YOtrTmreSXDT+KOGYgLM5
         h/Y040kul1tCb43QazGr43VMM01BvflgkNhkOO0XAEKEIE6drxp0mzGAgj7jF1bN8ZTi
         0eKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz8zp2n9Ff2Di2Tr8LlsoBeNwFGsTsvtrrNxvJ9iPMimDWLDB9TsgYuSAoPOpMGpLQTH4bFG4l/xyT@vger.kernel.org
X-Gm-Message-State: AOJu0YxQXZTZxgfa8UDeoHaYWCHZvIWPq1EoZFEJrGyfLDcxRJU/17Hq
	EddIUd4soFW8ko75PaEYstsOKMCeisX3vQ5qbFjlf1xS4oG5G5uOmhB1p7e97jryn2e7e3BO2x6
	pHshCXn5In488NUDo+dogMmBunDfS0uKQfeOZoyPHN7E6eKPvfUJxQN7v84H4x2Ut
X-Gm-Gg: ATEYQzyP0YR/oFOQaow55r87wNB4Y1TRuRwygCoGFaltNEztPhacd3ReO3aZTAtp1N0
	tvEGO1LI7WWgZxBeY/SSRdfnhosJnlUrjiSZn9eXILMfTM1JSqw42KA7nF/uOIxR5R7nBcknJJX
	PYRhvfGwRs4h9QcDvLtxcqQ+vbxmif6rD27oVvcsyc15cDvjh0uZqSIjk/gTl8ioXP+w10AY6vW
	F8XhyYLNdj3gnPHYWv6Ooy3QR0k4CPk3qEj4oXa7LlosoLSSWdMvSdNjfDUHixFPTUxi4Uf+rKc
	oUyL5WJIBydSPw9/qDMtG4xOJKHtlAHWblFrlt2mrQOKBZ+PeEf7z0NyMWjEnp9gvv3Bv/kADOr
	3gw4WPgGAXINSkzi56i0hs/qlOPHFH8+oWg==
X-Received: by 2002:a05:622a:8d17:b0:50b:4a3c:8917 with SMTP id d75a77b69052e-50b994a6c29mr66147651cf.24.1774624753624;
        Fri, 27 Mar 2026 08:19:13 -0700 (PDT)
X-Received: by 2002:a05:622a:8d17:b0:50b:4a3c:8917 with SMTP id d75a77b69052e-50b994a6c29mr66147141cf.24.1774624753064;
        Fri, 27 Mar 2026 08:19:13 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722be47a4sm155608075e9.0.2026.03.27.08.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:19:12 -0700 (PDT)
Date: Fri, 27 Mar 2026 17:19:10 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 01/11] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Message-ID: <qen34qavxbx4deuyf2wk5n5qujcqbewpbtnqk4rxgbr26nbnvf@gehbmireosxw>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
 <20260326-x1e-camss-csi2-phy-dtsi-v3-1-1d5a9306116a@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-1-1d5a9306116a@linaro.org>
X-Proofpoint-GUID: dr3ANBtDRw1BdRqVcZ2fq0LtVeyo-0Rj
X-Proofpoint-ORIG-GUID: dr3ANBtDRw1BdRqVcZ2fq0LtVeyo-0Rj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNSBTYWx0ZWRfX0xy4ywjejfEE
 6kecYcvyjwpBKylrt6nttpBS6531lscgQh2anL0ShoJv4XpplmpHwLaLaJMxi3OZjh9UW/MAYvA
 Nxw/Er97NWHixBJeCAE4lQu7JZMyX1cOWABJF1/h/DjZQSufdc5ksIU3KwHAIpO7xBv+cDz/89f
 OfnfsSeQ7K/ujilKfvg/Jj0G3cmeHb9iMwJGcs+hiaBEPR8/46LQsAJhfVaIxrH452jhWXH6vrk
 ZLT4FxlqIdHkMOYNKxNKLSBRrkbFLFlRiLnBvjz9+nQk+OMTintItuLFBtLfpJoSStB7XYiV02n
 1W1/Q1ru4YkZSuNf3VO9Icc4w7Vp5lx9EYsmQcoUrNrKaJbTfOjKUOYD4e3Nx4H1q2pNFVSWhIN
 GDT/7uh5M1iMXb9TxC/tFivWc8hX82TInauX7mKxy3g/Me/bw5gRjSZDuc8J3znb4JNhtp5E3qp
 WeDB4804et5e9RP8pnQ==
X-Authority-Analysis: v=2.4 cv=JLs2csKb c=1 sm=1 tr=0 ts=69c69ff2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=enRrE9bUkXY5DYgRGdkA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270105

On 26-03-26 10:27:38, Bryan O'Donoghue wrote:
> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> of previous CAMCC blocks with the exception of having two required
> power-domains not just one.

Nit: maybe we should be using Hamoa instead of x1e80100 ...

> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
