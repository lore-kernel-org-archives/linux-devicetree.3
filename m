Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDD92EEE77
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783927234; cv=none; b=IfiBj8eMyWR1pwQFMl+LQr2aOAyyeQErmldTWhteu3SjKdpzKsfzYrlDo3pPv+JD3YD7aN1qIaUEVZTDOGZBp5fL39C1WwRDquGA5Qdg+R9GuY/4l95I2ciXfVu3NdNDnU+vnxHf+JK9zHMbBTV9HEVub4sLRrYKma9g3GDhCT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783927234; c=relaxed/simple;
	bh=0Z1Bn2feo6g2YqQo4iprKdFnf3O2bNtJay3tzNauvVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vl/y2n0Npx6yoIMAsdYR8AsjI8tDWYpVlnxduAO2+rlYsrnfO5F98IRLQ0hG5xwUrjCzRbs2qLtVjknlRDUW5ROy+rnuJ6Upth+ujpsD/jxDzFs8RUwEYFrG4VBtTBo2qVu12V96ELYNosJ753DfFNM41ga8NW9F6BxE6o/pSx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X79RIm6O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nt+A7m8Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X79RIm6O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nt+A7m8Y"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nxkq390906
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bNv+b9LdqbQvBVnVS9SYjw6b
	sRFXfGraMJ1uo1KKPgk=; b=X79RIm6OaM9QA7ktLcGA/Y6uOmSuBpi7vviBhrZz
	cYo+PxwwdXGPZ7izbUwd0wnOjqYHDez7wG8sVaqOSpfhEcdyksLuMGAxzSDAxXyR
	rknCi9jj8P4xEjgQ5MzjaCCFWv7k0po3Y74NLQnHL6xsOq/nuGJk0MN0cZG/Gg52
	QAvLtoXDp95jcZv+P8fKry1LlRtlu6jlbb+KM3P9Dl5PPKZUptytPIJKjXsqx4a3
	57fcPbc3QPbFWlyIQ8ZDmB2ugUz+KLVOXcMOGrCmXelAug0b0WwnV3VODxYGnaZc
	5IGlgCHc9O3iOrF/CYcqgET2Gfa9tA1ioRC3XnXJIaMqNg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gmtk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:20:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso4380630a12.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 00:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783927232; x=1784532032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bNv+b9LdqbQvBVnVS9SYjw6bsRFXfGraMJ1uo1KKPgk=;
        b=Nt+A7m8Y7O/uWNMbNH7FJCaPccYXUphJjFy7xJYIVv/Iy/iJYiA64uREtEF4goVgvW
         0qi8BsK/gzXNCknq4uyq63ngHFdNDCv/Y0ijhWdazxoIe1yE7Vl4znIl+bAEyrjfaMcb
         aQ2pr4Yyw3yiDTOw8KMfd5qMnLpBjE1KwwVwUMi7AEC+Jm5poT+SBLDfj7mZNPhf8J+f
         Bm+2L6Og4nXPvSr169qL0cWRfChidjLpqI6xnWgIyhls5lcfIWCMpYu4vwX1OU0ZwwTR
         P0VqJdPhAWTIqRpNe83GkrvuAanQYiY8L8BAaWatguM7LpUT2iOuRVNapwlQcRAyFHV0
         NDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927232; x=1784532032;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bNv+b9LdqbQvBVnVS9SYjw6bsRFXfGraMJ1uo1KKPgk=;
        b=pYWprJZffDyLlHdkuDoIzIxoCNnDNpaT61dEu2mai0o+V3lhUPmfpetEi/Bnp4MuQy
         0UoktFUeHzGY9UNDBWfToGHFzkqOaUHebfyn+wgCZrnk4AMN2OYFSZWUCVm9mfP9skGB
         QDIoeCgsHDF8LzqUNDv5BgRWtRHZgj95081lS92TonZX8UrDt+zKz1gvg/A08rct5ZOw
         MdFerWEh5KfbovY+tKsgUEoK4d/LmFWLlpyomE5AH7e79Y4CcTYkEq9WwtMypRqvuu+p
         70SD1wb1Oqv9dqZxjfF50NIOwNNu9enSsWAkCzmKk+apJDq2869WWuLWmqH23+jYLTwa
         8GHg==
X-Forwarded-Encrypted: i=1; AHgh+RoAypcs8dJh4ver5fmmQ72JvVOIVx95DiFF1xlj4LbdtJmv1tz0D0cCee/ACZWkkmHTVNRKyOS/hWA0@vger.kernel.org
X-Gm-Message-State: AOJu0YwAzONgsDN5hZXpbqwpfZ8RZemnL8RVcmE4yJ+iKANtf2gH+1xA
	QZ8zNC9LYRgD6aJVUYGJnXfVY1EBjy4XKDuEP2xtXm4L0bvyOwgPkyR5g7zMONjgW0tT0x/XXGP
	70l8NRDD+hX317+Y1fCswU/Ku1M31L0GJVA576rM9zNw1+kEOJdzJ+v2Rq18cVdzD
X-Gm-Gg: AfdE7ckyICzIIRe87I4bBANl5ykOJf0yh/BVs1PQvdzq6b3PIlOIhkvGlLCV2KmDb0E
	dKAtKHKnToAIa0f99jEKfkvLy79pxAAg99PIUp6DpbAmn2Uh1aiJEd6kzFcc+cB6DF4asDUhYaO
	QDr6QTCaa5gkTFpUSLqsCG+h1Y3qKuxGtc1Gk9PNNwD6G7O9HJ55R7QXqAbCv2qMKl4uDK3hn5h
	2qPudl2N6UjYTBwYtylo3LCgEzpC1ds9bLuFXYOiCP7OIuA+0JcUMEF/H3LoyAhjST2Qcl9Kjux
	SComDIF9izdZZdsDu4K761adiNuTRYMVlewSfEgAbRUwstRkYwopFVzB68j8ToEfHX4vrql5ObS
	YkEOFd9Ta9HWAoHIks8WMI6WZaKYM1SCrUUl+xbPYhA0JtFKTZZbpRpNaYBgn
X-Received: by 2002:a05:6a21:9216:b0:3c1:c6e:9373 with SMTP id adf61e73a8af0-3c11029de1dmr8239216637.29.1783927232133;
        Mon, 13 Jul 2026 00:20:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:9216:b0:3c1:c6e:9373 with SMTP id adf61e73a8af0-3c11029de1dmr8239195637.29.1783927231737;
        Mon, 13 Jul 2026 00:20:31 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b9081d5c3sm18677102c88.9.2026.07.13.00.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:20:31 -0700 (PDT)
Date: Mon, 13 Jul 2026 00:20:29 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Message-ID: <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com>
References: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
 <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
 <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
 <alBOC18CpkGDhM2m@vbox>
 <20260710-warping-resolute-wasp-e4b8ce@quoll>
 <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org>
 <alFTxg0HLyke0gCK@vbox>
 <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a5491c0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=Us82urZKVve1r2lckrIA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: U2ZUkbw3vZ6mYXQSey-c8xc9R7McfwQf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NCBTYWx0ZWRfX5DT+n0xdcnQJ
 IXtW4Tz08yvasl0vyPg/GeGApvX9hINB4p4o8IFVnWg+se03p3rVrITyC0Wv9ImQjrqodaJNxOW
 wUxznGIykn2Bj0Q7ZbG0juyDIYmvZaeY/d/Bs1PH4Xst7UI5Z9xEnC1FJLv5LkYxEzPAdyr6+GZ
 gznSqb2sPsPnNFl3FVDykrGvf1olhkylAlj118ShTUBgzsZQsQ9+sd6PL7ymY70sNyZRu5ycwg9
 7SjzO1OLgjpCL6vAt4JrqbUVqxldvAe3HtuIgKi4viV/7NvLHQH8OYPf3DV805q7ZYUQnTqFYip
 NZByIyt+zzQZWh8S2pgIUsrxowRtklpGAHCFUqi/BajehpnK+zo9z304p5uyo9p/Lgrw1S74vhC
 +fV7uADwtd+G5iCL9MUBBa4+98x2xXCaSJyOeMZAsLBr+TuaZBenf9RNBCXflmKmvf04uLCLovM
 5cBtsPn/WL6sJ7iihLA==
X-Proofpoint-GUID: U2ZUkbw3vZ6mYXQSey-c8xc9R7McfwQf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NCBTYWx0ZWRfX7k6YQvv+4a6R
 rVDSIy9fctaZDPQa0cwHIa5RfOaD5sW+2DwCNMD5SolQ2g75E3kHMVIsqA9SZEFYJD1pHZjP3mw
 6q9MYYfPPUmbhFFSdOKYto1wlnkvyrQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130074

On 26-07-13 08:26:59, Krzysztof Kozlowski wrote:
> >> And Dmitry already said this at v3.
> > 
> > And I've already responded to his comment in v3:
> > https://lore.kernel.org/linux-usb/ahjYwJtiMsm0BcCh@vbox/
> 
> It does not change the fact that type of phy is implied by compatible,
> thus you do not get a new property.
> 
> 

For USB2 PHY, it has property "phy_type" already, it could extend support
list to eUSB2 like below, dwc3 qcom glue layer could call of_usb_get_phy_mode
or re-use dwc3->hsphy_mode depends on where it needs to use.

diff --git a/drivers/usb/phy/of.c b/drivers/usb/phy/of.c
index 1ab134f45d67..5cbf17d493ad 100644
--- a/drivers/usb/phy/of.c
+++ b/drivers/usb/phy/of.c
@@ -16,6 +16,7 @@ static const char *const usbphy_modes[] = {
 	[USBPHY_INTERFACE_MODE_ULPI]	= "ulpi",
 	[USBPHY_INTERFACE_MODE_SERIAL]	= "serial",
 	[USBPHY_INTERFACE_MODE_HSIC]	= "hsic",
+	[USBPHY_INTERFACE_MODE_EUSB2]	= "eusb2",
 };


-- 

Thanks,
Peter Chen
